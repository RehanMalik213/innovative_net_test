import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:innovative_net_test/core/enums/error_enums.dart';
import 'package:innovative_net_test/core/extensions/toasts/toast.dart';
import 'package:innovative_net_test/core/extensions/widget_ext/widget_extensions.dart';
import 'package:innovative_net_test/core/themes/app_colors.dart';
import 'package:innovative_net_test/core/widgets/dropdown/app_dropdown.dart';
import 'package:innovative_net_test/core/widgets/text/app_text.dart';
import 'package:innovative_net_test/features/dashboard/presentation/controller/dashboard_controller.dart';
import 'package:innovative_net_test/features/dashboard/presentation/widgets/attendance.dart';
import 'package:innovative_net_test/features/dashboard/presentation/widgets/chart.dart';

class Home extends GetView<DashboardController> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Obx(
            () => AppText(
              text: "Good Morning, ${controller.userData.value?.name}",
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
          Obx(
            () => AppText(
              text: controller.formattedDate.value,
              color: AppColors.headingColor,
            ),
          ),
          32.verticalSpace,
          Chart(),
          24.verticalSpace,
          Attendance(),
          24.verticalSpace,
          AppText(
            text: "Select Distributor",
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: AppColors.headingColor,
          ),
          8.verticalSpace,
          GetBuilder<DashboardController>(
            id: "updateDistributerUI",
            builder: (_) {
              return CustomDropdown(
                hint: "Select Distributor",
                items: controller.distributorNames,
                onChanged: (value) {
                  if (value != null) {
                    controller.onDistributorSelected(value);
                  }
                },
              ).onViewClick(() {
                if (controller.distributorNames.isEmpty) {
                  controller.fetchDistributors();
                }
              });
            },
          ),
          24.verticalSpace,
          AppText(
            text: "Select Route",
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: AppColors.headingColor,
          ),
          8.verticalSpace,
          GetBuilder<DashboardController>(
            id: "updateRouteUI",
            builder: (_) {
              return CustomDropdown(
                hint: "Select Route",
                items: controller.routeNames,
                onChanged: (value) {
                  if (value != null) {
                    controller.onRouteSelected(value);
                  }
                },
              ).onViewClick(() {
                if (controller.selectedDistributorId.value == null ||
                    controller.selectedDistributorId.value! == 0) {
                  "select distributor first".showToast(type: ToastType.warning);
                }
              });
            },
          ),
          24.verticalSpace,
        ],
      ),
    );
  }
}
