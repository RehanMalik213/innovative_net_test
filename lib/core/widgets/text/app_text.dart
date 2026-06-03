import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:innovative_net_test/core/themes/app_colors.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  const AppText({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.fontSize,
    this.fontWeight,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = style ?? const TextStyle();

    return Text(
      text.tr,
      softWrap: true,
      style: effectiveStyle.copyWith(
        fontSize: (fontSize ?? 14).sp,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color ?? AppColors.black,
      ),
      textAlign: textAlign ?? TextAlign.start,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
