// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class AppRoutes {
  AppRoutes._();
  static const LOGIN = _Paths.LOGIN;
  static const DASHBOARD = _Paths.DASHBOARD;
  static const PROFILE = _Paths.PROFILE;
  static const ATTENDANCE = _Paths.ATTENDANCE;
}

abstract class _Paths {
  _Paths._();
  static const LOGIN = '/login';
  static const DASHBOARD = '/dashboard';
  static const PROFILE = '/profile';
  static const ATTENDANCE = '/attendance';
}
