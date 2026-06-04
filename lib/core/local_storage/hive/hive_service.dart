import 'package:hive_flutter/hive_flutter.dart';
import 'package:innovative_net_test/core/local_storage/hive/models/attendance/attendance_model.dart';
import 'package:innovative_net_test/core/local_storage/hive/models/checkin/checkin_model.dart';
import 'package:innovative_net_test/core/local_storage/hive/models/tso/tso_model.dart';
import 'package:innovative_net_test/core/local_storage/hive/models/user/user_model.dart';

import 'box_keys.dart';

class HiveService {
  static final HiveService _instance = HiveService._internal();
  factory HiveService() => _instance;
  HiveService._internal();

  Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(UserDataAdapter());
    Hive.registerAdapter(UserAttendanceAdapter());
    Hive.registerAdapter(UserTsoAdapter());
    Hive.registerAdapter(DesignationAdapter());
    Hive.registerAdapter(DepartmentAdapter());
    Hive.registerAdapter(UserCitiesAdapter());
    Hive.registerAdapter(OfflineCheckInAdapter());

    await openBoxes();
  }

  Future<void> openBoxes() async {
    await Hive.openBox<UserData>(HiveBoxes.userBox);
    await Hive.openBox<OfflineCheckIn>(HiveBoxes.offlineCheckInBox);
  }

  Future<void> closeBoxes() async {
    await Hive.box<UserData>(HiveBoxes.userBox).close();
    await Hive.box<OfflineCheckIn>(HiveBoxes.offlineCheckInBox).close();
  }

  Future<void> saveUser(UserData user) async {
    final box = Hive.box<UserData>(HiveBoxes.userBox);
    await box.put('currentUser', user);
  }

  UserData? getUser() {
    return Hive.box<UserData>(HiveBoxes.userBox).get('currentUser');
  }

  Future<void> saveOfflineCheckIn(OfflineCheckIn data) async {
    final box = Hive.box<OfflineCheckIn>(HiveBoxes.offlineCheckInBox);

    final isDuplicate = box.values.any(
      (item) =>
          item.distributorId == data.distributorId &&
          item.routeId == data.routeId &&
          item.checkin.substring(0, 10) == data.checkin.substring(0, 10),
    );

    if (isDuplicate) {
      throw Exception("Duplicate Check-in: Already exists for today.");
    }

    await box.put(data.uuid, data);
  }

  List<OfflineCheckIn> getAllCheckIns() {
    final box = Hive.box<OfflineCheckIn>(HiveBoxes.offlineCheckInBox);
    return box.values.toList();
  }

  Future<void> markAsSynced(String uuid) async {
    final box = Hive.box<OfflineCheckIn>(HiveBoxes.offlineCheckInBox);
    final checkIn = box.get(uuid);

    if (checkIn != null) {
      final updatedCheckIn = OfflineCheckIn(
        uuid: checkIn.uuid,
        checkin: checkIn.checkin,
        userId: checkIn.userId,
        latitude: checkIn.latitude,
        longitude: checkIn.longitude,
        distributorId: checkIn.distributorId,
        routeId: checkIn.routeId,
        distributorName: checkIn.distributorName,
        routeName: checkIn.routeName,
        userName: checkIn.userName,
        isSynced: true,
      );
      await box.put(uuid, updatedCheckIn);
    }
  }

  Future<void> deleteCheckIn(String uuid) async {
    final box = Hive.box<OfflineCheckIn>(HiveBoxes.offlineCheckInBox);
    await box.delete(uuid);
  }

  Future<void> dispose() async {
    await Hive.close();
  }
}
