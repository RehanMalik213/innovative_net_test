class CheckOutRequestParams {
  final String checkout;
  final int userId;
  final String latitude;
  final String longitude;
  final int distributorId;
  final int routeId;

  CheckOutRequestParams({
    required this.checkout,
    required this.userId,
    required this.latitude,
    required this.longitude,
    required this.distributorId,
    required this.routeId,
  });

  Map<String, dynamic> toJson() => {
    "id": 97488,
    'out': checkout,
    'user_id': userId,
    'latitude': latitude,
    'longitude': longitude,
    'distributor_id': distributorId,
    'route_id': routeId,
  };
}
