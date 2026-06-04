import 'package:hive/hive.dart';
import 'package:innovative_net_test/core/local_storage/hive/models/attendance/attendance_model.dart';
import 'package:innovative_net_test/core/local_storage/hive/models/tso/tso_model.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserData extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final int city;
  @HiveField(4)
  final String? emailVerifiedAt;
  @HiveField(5)
  final String? image;
  @HiveField(6)
  final DateTime createdAt;
  @HiveField(7)
  final DateTime updatedAt;
  @HiveField(8)
  final int userType;
  @HiveField(9)
  final String username;
  @HiveField(10)
  final int status;
  @HiveField(11)
  final String token;
  @HiveField(12)
  final UserAttendance attendance;
  @HiveField(13)
  final UserTso tso;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.city,
    this.emailVerifiedAt,
    this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.userType,
    required this.username,
    required this.status,
    required this.token,
    required this.attendance,
    required this.tso,
  });
}
