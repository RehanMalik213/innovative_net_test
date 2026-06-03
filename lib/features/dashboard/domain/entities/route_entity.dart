import 'dart:convert';

RouteEntity routeEntityFromJson(String str) =>
    RouteEntity.fromJson(json.decode(str));

class RouteEntity {
  bool success;
  List<Datum> data;
  String message;

  RouteEntity({
    required this.success,
    required this.data,
    required this.message,
  });

  factory RouteEntity.fromJson(Map<String, dynamic> json) => RouteEntity(
    success: json["success"] ?? false,
    message: json["message"] ?? "Unknown error",
    data: json["success"] == true
        ? List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)))
        : [],
  );
}

class Datum {
  int id;
  String routeName;
  int distributorId;
  int tsoId;
  String day;
  int status;
  String username;
  DateTime createdAt;
  DateTime updatedAt;
  int shopsCount;

  Datum({
    required this.id,
    required this.routeName,
    required this.distributorId,
    required this.tsoId,
    required this.day,
    required this.status,
    required this.username,
    required this.createdAt,
    required this.updatedAt,
    required this.shopsCount,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    routeName: json["route_name"],
    distributorId: json["distributor_id"],
    tsoId: json["tso_id"],
    day: json["day"],
    status: json["status"],
    username: json["username"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    shopsCount: json["shops_count"],
  );
}
