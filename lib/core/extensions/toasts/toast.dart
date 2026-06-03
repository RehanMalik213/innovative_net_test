import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovative_net_test/core/enums/error_enums.dart';

extension ToastService on String {
  void showToast({ToastType type = ToastType.error}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.snackbar(
        _getTitle(type),
        this,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: _getColor(type).withValues(alpha: 0.1),
        colorText: _getColor(type),
      );
    });
  }

  String _getTitle(ToastType type) {
    switch (type) {
      case ToastType.success:
        return "Success";
      case ToastType.warning:
        return "Warning";
      default:
        return "Error";
    }
  }

  Color _getColor(ToastType type) {
    switch (type) {
      case ToastType.success:
        return Colors.green;
      case ToastType.warning:
        return Colors.orange;
      default:
        return Colors.red;
    }
  }
}
