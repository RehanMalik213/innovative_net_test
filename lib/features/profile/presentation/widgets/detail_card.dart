import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innovative_net_test/core/themes/app_colors.dart';
import 'package:innovative_net_test/core/widgets/small_box_with_icon.dart';
import 'package:innovative_net_test/core/widgets/text/app_text.dart';

class DetailCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String value;

  const DetailCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        children: [
          SmallBoxWithIcon(
            height: 31.h,
            width: 31.w,
            boxColor: AppColors.secondary.withValues(alpha: 0.4),
            radius: 10,
            imagePath: imagePath,
            imageColor: AppColors.secondary,
            imageSize: Size(32, 32),
          ),
          12.horizontalSpace,
          Column(
            crossAxisAlignment: .start,
            children: [
              AppText(text: title, color: AppColors.headingColor),
              4.verticalSpace,
              AppText(text: value, fontSize: 14, fontWeight: FontWeight.w600),
            ],
          ),
        ],
      ),
    );
  }
}
