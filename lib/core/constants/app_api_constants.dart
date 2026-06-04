class AppApiConstants {
  AppApiConstants._();
  static String baseUrl = 'https://daffy-stg.inplsnd.com';
  static String login = "/api/v1/login";
  static String distributor = "/api/v1/distributor/getTsoWiseDistributor";
  static String routes = "/api/v1/route/getTsoDistributorWiseRoute/";
  static String checkin = "/api/v1/attendence/in";
  static String checkout = "/api/v1/attendence/out";
}
