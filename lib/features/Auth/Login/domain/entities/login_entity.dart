import 'dart:convert';

import 'package:innovative_net_test/core/network/api_error.dart';

LoginEntity loginModelFromJson(String str) =>
    LoginEntity.fromJson(json.decode(str));

class LoginEntity {
  bool success;
  UserData userData;
  String message;

  LoginEntity({
    required this.success,
    required this.userData,
    required this.message,
  });

  factory LoginEntity.fromJson(Map<String, dynamic> json) => LoginEntity(
    success: json["success"] ?? false,
    message: json["message"] ?? "Unknown error",
    userData: json["success"] == true
        ? UserData.fromJson(json["data"])
        : throw APIError(json["data"]?["error"] ?? "Unknown error"),
  );
}

class UserData {
  int id;
  String name;
  String email;
  int city;
  dynamic emailVerifiedAt;
  dynamic image;
  DateTime createdAt;
  DateTime updatedAt;
  int userType;
  String username;
  int status;
  String token;
  UserAttendance attendance;
  UserTso tso;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.city,
    required this.emailVerifiedAt,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.userType,
    required this.username,
    required this.status,
    required this.token,
    required this.attendance,
    required this.tso,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    city: json["city"],
    emailVerifiedAt: json["email_verified_at"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    userType: json["user_type"],
    username: json["username"],
    status: json["status"],
    token: json["token"],
    attendance: UserAttendance.fromJson(json["attendence"]),
    tso: UserTso.fromJson(json["tso"]),
  );
}

class UserAttendance {
  int id;
  int userId;
  DateTime attendanceIn;
  dynamic out;
  int tsoId;
  int distributorId;
  int routeId;
  DateTime createdAt;
  DateTime updatedAt;
  String latitudeIn;
  String longitudeIn;
  dynamic latitudeOut;
  dynamic longitudeOut;
  DateTime date;

  UserAttendance({
    required this.id,
    required this.userId,
    required this.attendanceIn,
    required this.out,
    required this.tsoId,
    required this.distributorId,
    required this.routeId,
    required this.createdAt,
    required this.updatedAt,
    required this.latitudeIn,
    required this.longitudeIn,
    required this.latitudeOut,
    required this.longitudeOut,
    required this.date,
  });
  factory UserAttendance.fromJson(Map<String, dynamic> json) => UserAttendance(
    id: json["id"],
    userId: json["user_id"],
    attendanceIn: DateTime.parse(json["in"]),
    out: json["out"],
    tsoId: json["tso_id"],
    distributorId: json["distributor_id"],
    routeId: json["route_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    latitudeIn: json["latitude_in"],
    longitudeIn: json["longitude_in"],
    latitudeOut: json["latitude_out"],
    longitudeOut: json["longitude_out"],
    date: DateTime.parse(json["date"]),
  );
}

class UserTso {
  int id;
  String tsoCode;
  String name;
  dynamic companyName;
  String empId;
  String phone;
  String cellPhone;
  dynamic altPhone;
  String address;
  dynamic cnic;
  int city;
  String state;
  String country;
  dynamic zipCode;
  dynamic notes;
  int userId;
  int distributorId;
  int manager;
  int kpo;
  int kpo2;
  int kpo3;
  int departmentId;
  int designationId;
  int spotSale;
  int autoPayment;
  int geographyId;
  String map;
  dynamic locationName;
  dynamic longitude;
  dynamic latitude;
  dynamic radius;
  dynamic imagePath;
  int status;
  int active;
  String statusUsername;
  int statusUserId;
  String remarks;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic dateOfJoin;
  dynamic dateOfLeaving;
  Designation designation;
  Department department;
  UserCities cities;

  UserTso({
    required this.id,
    required this.tsoCode,
    required this.name,
    required this.companyName,
    required this.empId,
    required this.phone,
    required this.cellPhone,
    required this.altPhone,
    required this.address,
    required this.cnic,
    required this.city,
    required this.state,
    required this.country,
    required this.zipCode,
    required this.notes,
    required this.userId,
    required this.distributorId,
    required this.manager,
    required this.kpo,
    required this.kpo2,
    required this.kpo3,
    required this.departmentId,
    required this.designationId,
    required this.spotSale,
    required this.autoPayment,
    required this.geographyId,
    required this.map,
    required this.locationName,
    required this.longitude,
    required this.latitude,
    required this.radius,
    required this.imagePath,
    required this.status,
    required this.active,
    required this.statusUsername,
    required this.statusUserId,
    required this.remarks,
    required this.createdAt,
    required this.updatedAt,
    required this.dateOfJoin,
    required this.dateOfLeaving,
    required this.designation,
    required this.department,
    required this.cities,
  });

  factory UserTso.fromJson(Map<String, dynamic> json) => UserTso(
    id: json["id"],
    tsoCode: json["tso_code"],
    name: json["name"],
    companyName: json["company_name"],
    empId: json["emp_id"],
    phone: json["phone"],
    cellPhone: json["cell_phone"],
    altPhone: json["alt_phone"],
    address: json["address"],
    cnic: json["cnic"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    zipCode: json["zip_code"],
    notes: json["notes"],
    userId: json["user_id"],
    distributorId: json["distributor_id"],
    manager: json["manager"],
    kpo: json["kpo"],
    kpo2: json["kpo_2"],
    kpo3: json["kpo_3"],
    departmentId: json["department_id"],
    designationId: json["designation_id"],
    spotSale: json["spot_sale"],
    autoPayment: json["auto_payment"],
    geographyId: json["geography_id"],
    map: json["map"],
    locationName: json["location_name"],
    longitude: json["longitude"],
    latitude: json["latitude"],
    radius: json["radius"],
    imagePath: json["image_path"],
    status: json["status"],
    active: json["active"],
    statusUsername: json["status_username"],
    statusUserId: json["status_user_id"],
    remarks: json["remarks"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    dateOfJoin: json["date_of_join"],
    dateOfLeaving: json["date_of_leaving"],
    designation: Designation.fromJson(json["designation"]),
    department: Department.fromJson(json["department"]),
    cities: UserCities.fromJson(json["cities"]),
  );
}

class UserCities {
  int id;
  String name;
  int stateId;
  String outOfStockQuantity;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  CityDistributors cityDistributors;

  UserCities({
    required this.id,
    required this.name,
    required this.stateId,
    required this.outOfStockQuantity,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.cityDistributors,
  });
  factory UserCities.fromJson(Map<String, dynamic> json) => UserCities(
    id: json["id"],
    name: json["name"],
    stateId: json["state_id"],
    outOfStockQuantity: json["out_of_stock_quantity"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    cityDistributors: CityDistributors.fromJson(json["citydistributor"]),
  );
}

class CityDistributors {
  int cityId;
  int distributorId;

  CityDistributors({required this.cityId, required this.distributorId});
  factory CityDistributors.fromJson(Map<String, dynamic> json) =>
      CityDistributors(
        cityId: json["city_id"],
        distributorId: json["distributor_id"],
      );
}

class Designation {
  int id;
  String name;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  Designation({
    required this.id,
    required this.name,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
  factory Designation.fromJson(Map<String, dynamic> json) => Designation(
    id: json["id"],
    name: json["name"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );
}

class Department {
  int id;
  String name;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  Department({
    required this.id,
    required this.name,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
  factory Department.fromJson(Map<String, dynamic> json) => Department(
    id: json["id"],
    name: json["name"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );
}
