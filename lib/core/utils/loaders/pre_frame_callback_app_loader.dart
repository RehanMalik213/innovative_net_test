import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovative_net_test/core/constants/app_strings.dart';
import 'package:innovative_net_test/core/utils/loaders/loader_screen.dart';

class PreFrameCallbackAppLoader {
  PreFrameCallbackAppLoader._();
  static Timer? _timer;

  static void show({String message = AppStrings.loading}) {
    LoadingScreen.instance().show(
      context: Get.overlayContext!,
      text: message.tr,
    );

    _timer = Timer(Duration(milliseconds: 5000), () {
      hide();
    });
  }

  static void hide() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      LoadingScreen.instance().hide();
      _timer?.cancel();
    });
  }
}
