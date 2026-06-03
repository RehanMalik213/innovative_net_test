import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovative_net_test/core/usecase/no_params.dart';
import 'package:innovative_net_test/core/utils/logs_helper/app_logs.dart';
import 'package:innovative_net_test/core/widgets/text/app_text.dart';
import 'package:innovative_net_test/features/dashboard/domain/entities/distributer_entity.dart';
import 'package:innovative_net_test/features/dashboard/domain/entities/route_entity.dart';
import 'package:innovative_net_test/features/dashboard/domain/usecase/dashboard_usecase.dart';
import 'package:innovative_net_test/features/dashboard/presentation/pages/home.dart';
import 'package:intl/intl.dart';

class DashboardController extends GetxController {
  var currentIndex = 0.obs;
  var formattedDate = "".obs;
  var selectedTab = "Day".obs;
  final DashboardUsecase dashboardUsecase;
  DashboardController(this.dashboardUsecase);
  final List<Widget> pages = [
    Home(),
    AppText(text: "RoutePage"),
    AppText(text: "PayloadPage"),
    AppText(text: "HistoryPage"),
  ];

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  @override
  void onReady() {
    super.onReady();
    fetchDistributors();
    _setCurrentDate();
  }

  var distributorNames = <String>[].obs;

  var selectedDistributorName = Rxn<String>();
  var selectedDistributorId = Rxn<int>();
  List<DistributerData> allDistributors = [];

  void fetchDistributors() async {
    var result = await dashboardUsecase.call(NoParams());

    result.fold((error) => error.message.logs(), (data) {
      allDistributors = data.data;
      distributorNames.value = allDistributors
          .map((e) => e.distributorName)
          .toList();
    });
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
    var result = await dashboardUsecase.repository.getRoute(id: id);
    result.fold((error) => error.message.logs(), (data) {
      allRoute = data.data;
      routeNames.value = allRoute.map((e) => e.routeName).toList();
    });
  }

  void onRouteSelected(String name) {
    selectedRouteName.value = name;

    final selected = allRoute.firstWhere((e) => e.routeName == name);
    selectedDistributorId.value = selected.id;
    ("Selected ID: ${selectedDistributorId.value} Selected Name : ${selected.routeName}")
        .logs();
  }

  void _setCurrentDate() {
    final now = DateTime.now();
    formattedDate.value = "Today, ${DateFormat('MMM dd, yyyy').format(now)}";
  }
}
