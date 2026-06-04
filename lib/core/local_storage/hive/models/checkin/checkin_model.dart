import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'checkin_model.g.dart';

@HiveType(typeId: 6)
class OfflineCheckIn extends HiveObject {
  @HiveField(0)
  final String uuid;
  @HiveField(1)
  final DateTime checkin;
  @HiveField(2)
  final String userId;
  @HiveField(3)
  final String latitude;
  @HiveField(4)
  final String longitude;
  @HiveField(5)
  final int distributorId;
  @HiveField(6)
  final int routeId;
  @HiveField(7)
  final String distributorName;
  @HiveField(8)
  final String routeName;
  @HiveField(9)
  final String userName;
  @HiveField(10)
  final bool isSynced;

  OfflineCheckIn({
    String? uuid,
    required this.checkin,
    required this.userId,
    required this.latitude,
    required this.longitude,
    required this.distributorId,
    required this.routeId,
    required this.distributorName,
    required this.routeName,
    required this.userName,
    this.isSynced = false,
  }) : uuid = uuid ?? const Uuid().v4();
}
