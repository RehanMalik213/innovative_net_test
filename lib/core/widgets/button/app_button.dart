import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innovative_net_test/core/extensions/widget_ext/widget_extensions.dart';
import 'package:innovative_net_test/core/themes/app_colors.dart';
import 'package:innovative_net_test/core/widgets/text/app_text.dart';

class AppButton extends StatelessWidget {
  final String title;
  final double? height;
  final double? width;
  final bool loading;
  final VoidCallback onPress;
  final Color? textColor;
  final Color? color;
  const AppButton({
    super.key,
    required this.title,
    this.height,
    this.width,
    this.loading = false,
    required this.onPress,
    this.textColor,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 56.h,
      width: width ?? 335.w,
      decoration: BoxDecoration(
        color: color ?? AppColors.secondary,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(
        child: loading
            ? CircularProgressIndicator(color: AppColors.primary)
            : AppText(
                text: title,
                color: textColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
      ),
    ).onViewClick(onPress);
  }
}
