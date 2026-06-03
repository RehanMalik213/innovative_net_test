// To parse this JSON data, do
//
//     final distributorEntity = distributorEntityFromJson(jsonString);

import 'dart:convert';

DistributorEntity distributorEntityFromJson(String str) =>
    DistributorEntity.fromJson(json.decode(str));

class DistributorEntity {
  bool success;
  List<DistributerData> data;
  String message;

  DistributorEntity({
    required this.success,
    required this.data,
    required this.message,
  });

  factory DistributorEntity.fromJson(Map<String, dynamic> json) =>
      DistributorEntity(
        success: json["success"] ?? false,
        message: json["message"] ?? "Unknown error",
        data: json["success"] == true
            ? List<DistributerData>.from(
                json["data"].map((x) => DistributerData.fromJson(x)),
              )
            : [],
      );
}

class DistributerData {
  int id;
  String distributorCode;
  String customCode;
  String contactPerson;
  String distributorName;
  String parentCode;
  String distributorSubCode;
  int typeDistributorId;
  String level1;
  String level2;
  String level3;
  String email;
  String phone;
  dynamic altPhone;
  String address;
  String note;
  int cityId;
  String city;
  dynamic zip;
  int zoneId;
  dynamic minDiscount;
  dynamic maxDiscount;
  dynamic map;
  dynamic locationTitle;
  dynamic locationLatitude;
  dynamic locationLongitude;
  dynamic locationRadius;
  String username;
  String activeUnactive;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  DistributerData.distributerData({
    required this.id,
    required this.distributorCode,
    required this.customCode,
    required this.contactPerson,
    required this.distributorName,
    required this.parentCode,
    required this.distributorSubCode,
    required this.typeDistributorId,
    required this.level1,
    required this.level2,
    required this.level3,
    required this.email,
    required this.phone,
    required this.altPhone,
    required this.address,
    required this.note,
    required this.cityId,
    required this.city,
    required this.zip,
    required this.zoneId,
    required this.minDiscount,
    required this.maxDiscount,
    required this.map,
    required this.locationTitle,
    required this.locationLatitude,
    required this.locationLongitude,
    required this.locationRadius,
    required this.username,
    required this.activeUnactive,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DistributerData.fromJson(Map<String, dynamic> json) =>
      DistributerData.distributerData(
        id: json["id"],
        distributorCode: json["distributor_code"],
        customCode: json["custom_code"],
        contactPerson: json["contact_person"],
        distributorName: json["distributor_name"],
        parentCode: json["parent_code"],
        distributorSubCode: json["distributor_sub_code"],
        typeDistributorId: json["type_distributor_id"],
        level1: json["level1"],
        level2: json["level2"],
        level3: json["level3"],
        email: json["email"],
        phone: json["phone"],
        altPhone: json["alt_phone"],
        address: json["address"],
        note: json["note"],
        cityId: json["city_id"],
        city: json["city"],
        zip: json["zip"],
        zoneId: json["zone_id"],
        minDiscount: json["min_discount"],
        maxDiscount: json["max_discount"],
        map: json["map"],
        locationTitle: json["location_title"],
        locationLatitude: json["location_latitude"],
        locationLongitude: json["location_longitude"],
        locationRadius: json["location_radius"],
        username: json["username"],
        activeUnactive: json["active_unactive"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}
