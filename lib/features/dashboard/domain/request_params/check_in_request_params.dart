class CheckInRequestParams {
  final DateTime checkin;
  final String userId;
  final String latitude;
  final String longitude;
  final int distributorId;
  final int routeId;

  CheckInRequestParams({
    required this.checkin,
    required this.userId,
    required this.latitude,
    required this.longitude,
    required this.distributorId,
    required this.routeId,
  });

  Map<String, dynamic> toJson() => {
    'in': checkin,
    'user_id': userId,
    'latitude': latitude,
    'longitude': longitude,
    'distributor_id': distributorId,
    'route_id': routeId,
  };
}
