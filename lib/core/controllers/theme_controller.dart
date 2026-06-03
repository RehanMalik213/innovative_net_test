import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovative_net_test/core/local_storage/app_preferences.dart';

class ThemeController extends GetxController {
  var themeMode = ThemeMode.light.obs;

  @override
  void onInit() {
    super.onInit();
    themeMode.value = AppPreferences.instance.getThemeMode();
  }

  void toggleTheme() {
    themeMode.value = (themeMode.value == ThemeMode.dark)
        ? ThemeMode.light
        : ThemeMode.dark;
    AppPreferences.instance.saveThemeMode(themeMode.value.index);
    Get.changeThemeMode(themeMode.value);
  }
}
