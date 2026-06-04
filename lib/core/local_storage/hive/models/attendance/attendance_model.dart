import 'package:hive/hive.dart';

part 'attendance_model.g.dart';

@HiveType(typeId: 1)
class UserAttendance extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int userId;
  @HiveField(2)
  final DateTime? attendanceIn;
  @HiveField(3)
  final DateTime? attendanceOut;
  @HiveField(4)
  final int tsoId;
  @HiveField(5)
  final int distributorId;
  @HiveField(6)
  final int routeId;
  @HiveField(7)
  final DateTime? createdAt;
  @HiveField(8)
  final DateTime? updatedAt;
  @HiveField(9)
  final String? latitudeIn;
  @HiveField(10)
  final String? longitudeIn;
  @HiveField(11)
  final String? latitudeOut;
  @HiveField(12)
  final String? longitudeOut;
  @HiveField(13)
  final String? date;

  UserAttendance({
    required this.id,
    required this.userId,
    this.attendanceIn,
    this.attendanceOut,
    required this.tsoId,
    required this.distributorId,
    required this.routeId,
    this.createdAt,
    this.updatedAt,
    this.latitudeIn,
    this.longitudeIn,
    this.latitudeOut,
    this.longitudeOut,
    this.date,
  });
}
