// To parse this JSON data, do
//
//     final checkinEntity = checkinEntityFromJson(jsonString);

import 'dart:convert';

CheckinEntity checkinEntityFromJson(String str) =>
    CheckinEntity.fromJson(json.decode(str));

class CheckinEntity {
  bool success;
  List<Datum> data;
  String message;

  CheckinEntity({
    required this.success,
    required this.data,
    required this.message,
  });

  factory CheckinEntity.fromJson(Map<String, dynamic> json) => CheckinEntity(
    success: json["success"],
    data: json["success"] == true
        ? List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)))
        : [],
    message: json["message"],
  );
}

class Datum {
  int id;
  int userId;
  DateTime datumIn;
  DateTime out;
  int tsoId;
  int distributorId;
  int routeId;
  DateTime createdAt;
  DateTime updatedAt;
  String latitudeIn;
  String longitudeIn;
  String latitudeOut;
  String longitudeOut;
  DateTime date;

  Datum({
    required this.id,
    required this.userId,
    required this.datumIn,
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    datumIn: DateTime.parse(json["in"]),
    out: DateTime.parse(json["out"]),
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
