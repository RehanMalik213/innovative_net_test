import 'package:dio/dio.dart';
import 'package:innovative_net_test/core/constants/app_api_constants.dart';

import 'interceptors/header_log_interceptor.dart';
import 'interceptors/network_log_interceptor.dart';

class NetworkClient {
  static Dio get instance {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 50),
        receiveTimeout: const Duration(seconds: 50),
        headers: {'Accept': 'application/json'},
      ),
    );

    dio.interceptors.addAll([HeadersInterceptor(), NetworkLogInterceptor()]);
    return dio;
  }
}
