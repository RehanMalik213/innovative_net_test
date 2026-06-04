import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:innovative_net_test/app_routes/app_pages.dart';
import 'package:innovative_net_test/core/enums/error_enums.dart';
import 'package:innovative_net_test/core/extensions/toasts/toast.dart';
import 'package:innovative_net_test/core/local_storage/hive/hive_service.dart';
import 'package:innovative_net_test/core/local_storage/hive/models/checkin/checkin_model.dart';
import 'package:innovative_net_test/core/local_storage/hive/models/user/user_model.dart';
import 'package:innovative_net_test/core/usecase/no_params.dart';
import 'package:innovative_net_test/core/utils/loaders/app_loader.dart';
import 'package:innovative_net_test/core/utils/logs_helper/app_logs.dart';
import 'package:innovative_net_test/core/widgets/text/app_text.dart';
import 'package:innovative_net_test/features/dashboard/domain/entities/distributer_entity.dart';
import 'package:innovative_net_test/features/dashboard/domain/entities/route_entity.dart';
import 'package:innovative_net_test/features/dashboard/domain/request_params/check_in_request_params.dart';
import 'package:innovative_net_test/features/dashboard/domain/request_params/check_out_request_params.dart';
import 'package:innovative_net_test/features/dashboard/domain/usecase/dashboard_usecase.dart';
import 'package:innovative_net_test/features/dashboard/presentation/pages/checkin_history.dart';
import 'package:innovative_net_test/features/dashboard/presentation/pages/home.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

class DashboardController extends GetxController {
  var currentIndex = 0.obs;
  var formattedDate = "".obs;
  var selectedTab = "Day".obs;
  Rxn<UserData> userData = Rxn<UserData>();
  final DashboardUsecase dashboardUsecase;
  DashboardController(this.dashboardUsecase);
  final List<Widget> pages = [
    Home(),
    AppText(text: "RoutePage"),
    AppText(text: "PayloadPage"),
    CheckinHistory(),
  ];

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  @override
  void onReady() {
    super.onReady();
    // fetchDistributors();
    fetchUserData();
    _setCurrentDate();
  }

  var distributorNames = <String>[].obs;

  var selectedDistributorName = Rxn<String>();
  var selectedDistributorId = Rxn<int>();
  List<DistributerData> allDistributors = [];

  void fetchDistributors() async {
    AppLoader.show();
    var result = await dashboardUsecase.call(NoParams());
    AppLoader.hide();
    result.fold((error) => error.message.logs(), (data) {
      allDistributors = data.data;
      distributorNames.value = allDistributors
          .map((e) => e.distributorName)
          .toList();
    });
    update(["updateDistributerUI"]);
  }

  void onDistributorSelected(String name) async {
    selectedDistributorName.value = name;

    final selected = allDistributors.firstWhere(
      (e) => e.distributorName == name,
    );
    selectedDistributorId.value = selected.id;
    ("Selected ID: ${selectedDistributorId.value} Selected Name : ${selected.distributorName}")
        .logs();
    fetchRoutes(selected.id);
  }

  var routeNames = <String>[].obs;

  var selectedRouteName = Rxn<String>();
  var selectedRouteId = Rxn<int>();
  List<Datum> allRoute = [];

  void fetchRoutes(int id) async {
    AppLoader.show();
    var result = await dashboardUsecase.repository.getRoute(id: id);
    AppLoader.hide();
    result.fold((error) => error.message.logs(), (data) {
      allRoute = data.data;
      routeNames.value = allRoute.map((e) => e.routeName).toList();
    });
    update(["updateRouteUI"]);
  }

  void onRouteSelected(String name) {
    selectedRouteName.value = name;

    final selected = allRoute.firstWhere((e) => e.routeName == name);
    selectedRouteId.value = selected.id;
    ("Selected ID: ${selectedRouteId.value} Selected Name : ${selected.routeName}")
        .logs();
    checkCurrentStatus(selectedDistributorId.value ?? 0, selected.id);
  }

  void _setCurrentDate() {
    final now = DateTime.now();
    formattedDate.value = "Today, ${DateFormat('MMM dd, yyyy').format(now)}";
  }

  void fetchUserData() {
    final user = HiveService().getUser();
    if (user != null) {
      userData.value = user;
    } else {
      "Session expired. Please login again.".showToast(type: ToastType.warning);
      Get.offAllNamed(AppRoutes.LOGIN);
    }
  }

  Future<void> checkin() async {
    if (selectedDistributorId.value == null || selectedRouteId.value == null) {
      "Select distributor & route first".showToast(type: ToastType.warning);
      return;
    }

    final permissionStatus = await Permission.location.request();
    if (permissionStatus.isPermanentlyDenied) {
      "Permission permanently denied. Please enable location from settings."
          .showToast(type: ToastType.error);
      await openAppSettings();
      return;
    } else if (!permissionStatus.isGranted) {
      "Location permission is required.".showToast(type: ToastType.warning);
      await openAppSettings();
      return;
    }

    try {
      AppLoader.show();
      final position = await _getCurrentLocation();

      final checkinData = OfflineCheckIn(
        checkin: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
        userId: userData.value?.id ?? 0,
        latitude: position.latitude.toString(),
        longitude: position.longitude.toString(),
        distributorId: selectedDistributorId.value!,
        routeId: selectedRouteId.value!,
        distributorName: selectedDistributorName.value ?? "",
        routeName: selectedRouteName.value ?? "",
        userName: userData.value?.name ?? "",
      );

      await HiveService().saveOfflineCheckIn(checkinData);
      AppLoader.hide();
      "Check-in successful!".showToast(type: ToastType.success);
    } catch (e) {
      AppLoader.hide();
      "Error: ${e.toString()}".logs();
      "Error: ${e.toString()}".showToast(type: ToastType.error);
    }
  }

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) throw Exception("Location services disabled.");

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<void> checkout() async {
    if (selectedDistributorId.value == null || selectedRouteId.value == null) {
      "Select distributor & route first".showToast(type: ToastType.warning);
      return;
    }

    final permissionStatus = await Permission.location.request();
    if (permissionStatus.isPermanentlyDenied) {
      "Permission permanently denied. Please enable location from settings."
          .showToast(type: ToastType.error);
      await openAppSettings();
      return;
    } else if (!permissionStatus.isGranted) {
      "Location permission is required.".showToast(type: ToastType.warning);
      await openAppSettings();
      return;
    }

    try {
      AppLoader.show();
      final position = await _getCurrentLocation();

      final params = CheckOutRequestParams(
        checkout: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
        userId: userData.value?.id ?? 0,
        latitude: position.latitude.toString(),
        longitude: position.longitude.toString(),
        distributorId: selectedDistributorId.value!,
        routeId: selectedRouteId.value!,
      );
      var result = await dashboardUsecase.repository.checkout(params: params);
      AppLoader.hide();
      result.fold((error) => error.message.showToast(), (data) async {
        "Check-out successful!".showToast(type: ToastType.success);
        isAlreadyCheckedIn.value = false;
      });
    } catch (e) {
      AppLoader.hide();
      "Error: ${e.toString()}".logs();
      "Error: ${e.toString()}".showToast(type: ToastType.error);
    }
  }

  RxBool isAlreadyCheckedIn = false.obs;
  void checkCurrentStatus(int distId, int routeId) {
    final allRecords = HiveService().getAllCheckIns();

    final todayActiveRecord = allRecords.firstWhereOrNull(
      (item) => item.distributorId == distId && item.routeId == routeId,
    );

    if (todayActiveRecord != null) {
      "todayActiveRecord ${todayActiveRecord.isSynced}".logs();
      isAlreadyCheckedIn.value = todayActiveRecord.isSynced;
    } else {
      isAlreadyCheckedIn.value = false;
    }
  }

  Future<void> syncData({
    required String checkin,
    required int userId,
    required String latitude,
    required String longitude,
    required int distributorId,
    required int routeId,
    required String uui,
  }) async {
    final params = CheckInRequestParams(
      checkin: checkin,
      userId: userId,
      latitude: latitude,
      longitude: longitude,
      distributorId: distributorId,
      routeId: routeId,
    );
    AppLoader.show();
    var result = await dashboardUsecase.repository.syncCheckinData(
      params: params,
    );
    AppLoader.hide();
    result.fold((error) => error.message.showToast(), (data) async {
      await HiveService().markAsSynced(uui);
      "Data synced successfully".showToast(type: ToastType.success);
      if (selectedDistributorId.value != null &&
          selectedRouteId.value != null) {
        checkCurrentStatus(
          selectedDistributorId.value!,
          selectedRouteId.value!,
        );
      }
    });
  }
}
