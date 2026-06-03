import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:innovative_net_test/core/themes/app_colors.dart';
import 'package:innovative_net_test/core/widgets/text/app_text.dart';
import 'package:innovative_net_test/features/dashboard/presentation/controller/dashboard_controller.dart';

class Chart extends GetView<DashboardController> {
  const Chart({super.key});

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
              Container(
                height: 40.h,
                width: 238.w,
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Color(0xffF3F4F6),
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Obx(
                  () => Row(
                    children: [
                      _buildTabItem("Day"),
                      _buildTabItem("Month"),
                      _buildTabItem("Year"),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 10.w),
                decoration: BoxDecoration(
                  color: Color(0xff008236).withValues(alpha: .3),
                  border: Border.all(color: Color(0xff008236)),
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.fiber_manual_record,
                      size: 10,
                      color: Colors.green,
                    ),
                    const SizedBox(width: 4),
                    const Text("Online", style: TextStyle(color: Colors.green)),
                  ],
                ),
              ),
            ],
          ),
          24.verticalSpace,
          _buildShopChartSection(),
        ],
      ),
    );
  }

  // Helper Widget
  Widget _buildTabItem(String label) {
    bool isSelected = controller.selectedTab.value == label;
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.selectedTab.value = label,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 4,
                    ),
                  ]
                : [],
          ),
          child: AppText(
            text: label,
            color: isSelected ? const Color(0xff1a237e) : Colors.grey,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildShopChartSection() {
    return Row(
      children: [
        // Pie Chart Section
        SizedBox(
          height: 120.h,
          width: 120.w,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PieChart(
                PieChartData(
                  startDegreeOffset: -90,
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: [
                    PieChartSectionData(
                      value: 25,
                      color: AppColors.secondary,
                      radius: 15,
                      showTitle: false,
                    ),

                    PieChartSectionData(
                      value: 18,
                      color: AppColors.primary,
                      radius: 15,
                      showTitle: false,
                    ),
                    PieChartSectionData(
                      value: 7,
                      color: AppColors.third,
                      radius: 15,
                      showTitle: false,
                    ),
                    PieChartSectionData(
                      value: 25,
                      color: Color(0xffF0F1F3),
                      radius: 15,
                      showTitle: false,
                    ),
                  ],
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    text: "TOTAL SHOPS",
                    fontWeight: FontWeight.w700,
                    fontSize: 10,
                    color: AppColors.hintColor,
                  ),
                  AppText(
                    text: "25/50",
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: AppColors.primary,
                  ),
                ],
              ),
            ],
          ),
        ),
        20.horizontalSpace,
        // Legend Section
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLegend("Total Deliveries", "25", Colors.teal),
              _buildLegend("Completed", "18", Color(0xff1a237e)),
              _buildLegend("Pending Shops", "12", Colors.orange),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLegend(String title, String value, Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.fiber_manual_record, size: 12, color: color),
              8.horizontalSpace,
              AppText(
                text: title,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: AppColors.headingColor,
              ),
            ],
          ),
          AppText(
            text: value,
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
