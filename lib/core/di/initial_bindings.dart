import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:innovative_net_test/core/controllers/theme_controller.dart';
import 'package:innovative_net_test/core/network/network_api_service.dart';
import 'package:innovative_net_test/core/network/network_client.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // Dio Instance
    Get.lazyPut<Dio>(() => NetworkClient.instance, fenix: true);

    // NetworkApiService Instance
    Get.lazyPut<NetworkApiService>(
      () => NetworkApiService(Get.find<Dio>()),
      fenix: true,
    );

    // ThemeController Instance
    Get.lazyPut<ThemeController>(() => ThemeController());
  }
}
