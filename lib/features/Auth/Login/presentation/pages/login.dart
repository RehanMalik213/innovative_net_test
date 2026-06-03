import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:innovative_net_test/core/constants/app_images.dart';
import 'package:innovative_net_test/core/constants/app_strings.dart';
import 'package:innovative_net_test/core/themes/app_colors.dart';
import 'package:innovative_net_test/core/widgets/app_image_view.dart';
import 'package:innovative_net_test/core/widgets/app_text_field.dart';
import 'package:innovative_net_test/core/widgets/base_page.dart';
import 'package:innovative_net_test/core/widgets/button/app_button.dart';
import 'package:innovative_net_test/core/widgets/small_box_with_icon.dart';
import 'package:innovative_net_test/core/widgets/text/app_text.dart';
import 'package:innovative_net_test/features/Auth/Login/presentation/controller/login_controller.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return BasePage(
      isScrollEnable: true,
      horizontalSpace: 24,
      child: Column(
        mainAxisAlignment: .center,
        children: [
          150.verticalSpace,
          SmallBoxWithIcon(
            height: 64.h,
            width: 64.w,
            boxColor: AppColors.primary,
            radius: 16,
            imagePath: AppImages.loginIcon,
            imageColor: AppColors.white,
            imageSize: Size(32, 32),
          ),
          24.verticalSpace,
          AppText(
            text: AppStrings.welcome,
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
          8.verticalSpace,
          AppText(
            text: AppStrings.welcomeSubTitle,
            color: AppColors.headingColor,
          ),
          32.verticalSpace,
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 24.h),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderColor),
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                AppText(
                  text: AppStrings.email,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: AppColors.headingColor,
                ),
                8.verticalSpace,
                AppTextField(
                  controller: controller.email,
                  backgroundColor: Colors.transparent,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                  keyboardType: TextInputType.name,
                  hint: AppStrings.emailHint,
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 12.w),
                    child: AppImageView(
                      imagePath: AppImages.mail,
                      imageSize: Size(20, 20),
                      color: AppColors.hintColor,
                    ),
                  ),
                ),
                16.verticalSpace,
                AppText(
                  text: AppStrings.password,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: AppColors.headingColor,
                ),
                8.verticalSpace,
                Obx(
                  () => AppTextField(
                    expands: false,
                    controller: controller.password,
                    backgroundColor: Colors.transparent,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                    keyboardType: TextInputType.visiblePassword,
                    hint: AppStrings.passwordHint,
                    obscureText: !controller.isPasswordVisible.value,
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 12.w),
                      child: AppImageView(
                        imagePath: AppImages.lock,
                        imageSize: Size(20, 20),
                        color: AppColors.hintColor,
                      ),
                    ),
                    suffixIcon: IconButton(
                      highlightColor: Colors.transparent,
                      icon: Icon(
                        controller.isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                  ),
                ),
                24.verticalSpace,
                Center(
                  child: AppButton(
                    title: AppStrings.login,
                    onPress: () => controller.login(),
                    textColor: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
