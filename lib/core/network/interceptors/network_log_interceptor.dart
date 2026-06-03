import 'package:dio/dio.dart';
import 'package:innovative_net_test/core/utils/logs_helper/app_logs.dart';

class NetworkLogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    "API Request ==> [${options.method}] ${options.uri}".logs();
    ('headers ==> ${options.headers}').logs();
    ('body ==> ${options.data}').logs();

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';
    ('${options.method} request ==> $requestPath').logs();
    ('Error type: ${err.error} \n '
            'Error message: ${err.message}')
        .logs();
    handler.next(err);
  }
}
