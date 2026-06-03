import 'package:get/get.dart';
import 'package:innovative_net_test/features/Auth/Login/data/datasources/remote_datasource.dart';
import 'package:innovative_net_test/features/Auth/Login/data/repositories/auth_repository_impl.dart';
import 'package:innovative_net_test/features/Auth/Login/domain/usecase/login_usecase.dart';
import 'package:innovative_net_test/features/Auth/Login/presentation/controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // Remote Data Source
    Get.lazyPut(() => AuthRemoteDataSourceImpl(Get.find()));

    // Repository
    Get.lazyPut(() => AuthRepositoryImpl(Get.find<AuthRemoteDataSourceImpl>()));

    // Usecase
    Get.lazyPut(() => LoginUsecase(Get.find<AuthRepositoryImpl>()));

    //Controller
    Get.lazyPut(() => LoginController(Get.find<LoginUsecase>()), fenix: true);
  }
}
