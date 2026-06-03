import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovative_net_test/core/controllers/theme_controller.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();

    return Obx(() {
      return IconButton(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        icon: themeController.themeMode.value == ThemeMode.dark
            ? const Icon(Icons.dark_mode)
            : const Icon(Icons.light_mode),
        onPressed: () => themeController.toggleTheme(),
      );
    });
  }
}
