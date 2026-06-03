import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innovative_net_test/core/constants/app_images.dart';
import 'package:innovative_net_test/core/themes/app_colors.dart';
import 'package:innovative_net_test/core/widgets/app_image_view.dart';
import 'package:innovative_net_test/core/widgets/button/app_button.dart';
import 'package:innovative_net_test/core/widgets/text/app_text.dart';

class Attendance extends StatelessWidget {
  const Attendance({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 24.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              AppText(
                text: "Attendance",
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 10.w),
                decoration: BoxDecoration(
                  color: Color(0xffF9FAFB),
                  border: Border.all(color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  "Inactive",
                  style: TextStyle(
                    color: AppColors.headingColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          5.verticalSpace,
          Row(
            children: [
              AppImageView(
                imagePath: AppImages.clock,
                imageSize: Size(14.w, 14.h),
              ),
              4.horizontalSpace,
              Text(
                "10:24 AM",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          24.verticalSpace,
          Center(
            child: AppButton(
              title: "Check In Now",
              onPress: () {},
              textColor: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
