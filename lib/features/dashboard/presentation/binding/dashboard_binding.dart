import 'package:get/get.dart';
import 'package:innovative_net_test/features/dashboard/data/datasources/remote_datasource.dart';
import 'package:innovative_net_test/features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:innovative_net_test/features/dashboard/domain/usecase/dashboard_usecase.dart';
import 'package:innovative_net_test/features/dashboard/presentation/controller/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    // Remote Data Source
    Get.lazyPut(() => DashboardRemoteDataSourceImpl(Get.find()));

    // Repository
    Get.lazyPut(
      () => DashboardRepositoryImpl(Get.find<DashboardRemoteDataSourceImpl>()),
    );

    // Usecase
    Get.lazyPut(() => DashboardUsecase(Get.find<DashboardRepositoryImpl>()));

    Get.lazyPut(() => DashboardController(Get.find<DashboardUsecase>()));
  }
}
