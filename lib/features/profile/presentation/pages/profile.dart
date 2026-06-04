import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:innovative_net_test/core/constants/app_images.dart';
import 'package:innovative_net_test/core/extensions/widget_ext/widget_extensions.dart';
import 'package:innovative_net_test/core/themes/app_colors.dart';
import 'package:innovative_net_test/core/widgets/app_image_view.dart';
import 'package:innovative_net_test/core/widgets/base_page.dart';
import 'package:innovative_net_test/core/widgets/text/app_text.dart';
import 'package:innovative_net_test/features/dashboard/presentation/controller/dashboard_controller.dart';
import 'package:innovative_net_test/features/profile/presentation/controller/profile_controller.dart';
import 'package:innovative_net_test/features/profile/presentation/widgets/detail_card.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  final controller = Get.find<ProfileController>();
  final dashboardController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return BasePage(
      isScrollEnable: true,
      horizontalSpace: 16,
      appbar: AppBar(
        automaticallyImplyLeading: false,
        leading: BackButton(),
        title: Column(
          crossAxisAlignment: .start,
          children: [
            AppText(
              text: "My Profile",
              color: AppColors.primary,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
            AppText(
              text: "View Your Account Details",
              color: AppColors.headingColor,
            ),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          16.verticalSpace,
          Container(
            height: 128.h,
            color: AppColors.secondary,
            padding: EdgeInsets.all(24),
            child: Row(
              children: [
                Container(
                  height: 80.w,
                  width: 80.w,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: Center(
                    child: AppImageView(
                      imagePath: AppImages.person,
                      imageSize: Size(20.w, 20.h),
                    ),
                  ),
                ),
                16.horizontalSpace,
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    AppText(
                      text: "${dashboardController.userData.value?.name}",
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                    AppText(
                      text:
                          "${dashboardController.userData.value?.tso.department.name}",
                      color: AppColors.white.withValues(alpha: 0.8),
                    ),
                    AppText(
                      text:
                          "ID: ${dashboardController.userData.value?.tso.cities.name}",
                      color: AppColors.white.withValues(alpha: 0.8),
                    ),
                  ],
                ),
              ],
            ),
          ).roundedCorner(16),
          32.verticalSpace,
          AppText(
            text: "App & Company",
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: AppColors.headingColor,
          ),
          12.verticalSpace,
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              DetailCard(
                imagePath: AppImages.loginIcon,
                title: "Company Name",
                value: "${dashboardController.userData.value?.tso.name}",
              ),
              DetailCard(
                imagePath: AppImages.appVersion,
                title: "App Version",
                value: "1.0.13",
              ),
            ],
          ),
          16.verticalSpace,
          AppText(
            text: "Work Information",
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: AppColors.headingColor,
          ),
          12.verticalSpace,
          DetailCard(
            imagePath: AppImages.person,
            title: "Employee ID",
            value: "${dashboardController.userData.value?.tso.empId}",
          ),
          12.verticalSpace,
          DetailCard(
            imagePath: AppImages.loginIcon,
            title: "Department Name",
            value: "${dashboardController.userData.value?.tso.department.name}",
          ),
          12.verticalSpace,
          DetailCard(
            imagePath: AppImages.date,
            title: "Date Of Joining",
            value: "2025-05-13",
          ),
          16.verticalSpace,
          AppText(
            text: "Contact Information",
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: AppColors.headingColor,
          ),
          12.verticalSpace,
          DetailCard(
            imagePath: AppImages.phone,
            title: "Phone Number",
            value: "${dashboardController.userData.value?.tso.phone}",
          ),
          12.verticalSpace,
          DetailCard(
            imagePath: AppImages.mail,
            title: "Email Address",
            value: "${dashboardController.userData.value?.email}",
          ),

          24.verticalSpace,
        ],
      ),
    );
  }
}
