import 'package:hive/hive.dart';

part 'tso_model.g.dart';

@HiveType(typeId: 2)
class UserTso extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String tsoCode;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String empId;
  @HiveField(4)
  final String phone;
  @HiveField(5)
  final String address;
  @HiveField(6)
  final Designation designation;
  @HiveField(7)
  final Department department;
  @HiveField(8)
  final UserCities cities;

  UserTso({
    required this.id,
    required this.tsoCode,
    required this.name,
    required this.empId,
    required this.phone,
    required this.address,
    required this.designation,
    required this.department,
    required this.cities,
  });
}

@HiveType(typeId: 3)
class Designation extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;

  Designation({required this.id, required this.name});
}

@HiveType(typeId: 4)
class Department extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;

  Department({required this.id, required this.name});
}

@HiveType(typeId: 5)
class UserCities extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;

  UserCities({required this.id, required this.name});
}
