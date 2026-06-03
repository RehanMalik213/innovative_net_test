import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeneralDialogHelper {
  static void showAppAlert({
    required BuildContext context,
    required Widget content,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 10.h,
            bottom: 20.h,
            left: 20.w,
            right: 20.w,
          ),
          child: content,
        ),
      ),
    );
  }

  /// Call this to dismiss the dialog
  static void dismiss(BuildContext context) {
    if (Navigator.of(context, rootNavigator: true).canPop()) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}
