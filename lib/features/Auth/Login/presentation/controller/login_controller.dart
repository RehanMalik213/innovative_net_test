import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovative_net_test/app_routes/app_pages.dart';
import 'package:innovative_net_test/core/enums/error_enums.dart';
import 'package:innovative_net_test/core/extensions/toasts/toast.dart';
import 'package:innovative_net_test/core/local_storage/app_preferences.dart';
import 'package:innovative_net_test/core/local_storage/hive/hive_service.dart';
import 'package:innovative_net_test/core/local_storage/hive/mappers/user_mapper.dart';
import 'package:innovative_net_test/core/utils/loaders/app_loader.dart';
import 'package:innovative_net_test/features/Auth/Login/domain/entities/login_entity.dart';
import 'package:innovative_net_test/features/Auth/Login/domain/request_params/login_request_params.dart';
import 'package:innovative_net_test/features/Auth/Login/domain/usecase/login_usecase.dart';

class LoginController extends GetxController {
  final LoginUsecase loginUsecase;
  Rxn<LoginEntity> currentUser = Rxn<LoginEntity>();

  LoginController(this.loginUsecase);

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  var isPasswordVisible = false.obs;
  AppPreferences instance = AppPreferences.instance;

  @override
  void onReady() {
    super.onReady();
    if (instance.hasBearerToken()) {
      Get.offAllNamed(AppRoutes.DASHBOARD);
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  bool validateInputs() {
    if (email.text.isEmpty || !email.text.contains('@')) {
      "Invalid Email".showToast(type: ToastType.warning);
      return false;
    }
    if (password.text.length < 6) {
      "Password must be at least 6 characters".showToast(
        type: ToastType.warning,
      );
      return false;
    }
    return true;
  }

  Future<void> login() async {
    if (!validateInputs()) return;
    AppLoader.show();
    final result = await loginUsecase(
      LoginRequestParams(
        email: email.text.trim(),
        password: password.text.trim(),
      ),
    );
    AppLoader.hide();
    result.fold((error) => error.message.showToast(), (data) async {
      currentUser.value = data;
      "Login Successful".showToast(type: ToastType.success);
      instance.saveBearerToken(data.userData.token);

      final hiveUser = data.userData.toHive();
      await HiveService().saveUser(hiveUser);
      Get.offAllNamed(AppRoutes.DASHBOARD);
    });
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }
}
