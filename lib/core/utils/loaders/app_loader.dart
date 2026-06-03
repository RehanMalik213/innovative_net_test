import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovative_net_test/core/constants/app_strings.dart';
import 'package:innovative_net_test/core/utils/loaders/loader_screen.dart';

class AppLoader {
  AppLoader._();
  static Timer? _timer;
  static bool _isLoaderShowing = false;

  static bool get isLoaderShowing => _isLoaderShowing;

  static void show({String message = AppStrings.loading}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _timer?.cancel();

      LoadingScreen.instance().show(
        context: Get.overlayContext!,
        text: message,
      );

      _isLoaderShowing = true;
      _timer = Timer(Duration(seconds: 60), () {
        hide();
      });
    });
  }

  static void hide() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      LoadingScreen.instance().hide();

      _timer?.cancel();
      _timer = null;
      _isLoaderShowing = false;
    });
  }
}
