import 'package:get/get.dart';
import 'package:innovative_net_test/features/Auth/Login/presentation/binding/login_binding.dart';
import 'package:innovative_net_test/features/Auth/Login/presentation/pages/login.dart';
import 'package:innovative_net_test/features/dashboard/presentation/binding/dashboard_binding.dart';
import 'package:innovative_net_test/features/dashboard/presentation/pages/dashboard.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: '/',
      page: () => Login(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
