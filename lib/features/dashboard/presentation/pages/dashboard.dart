import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:innovative_net_test/app_routes/app_pages.dart';
import 'package:innovative_net_test/core/constants/app_images.dart';
import 'package:innovative_net_test/core/constants/app_strings.dart';
import 'package:innovative_net_test/core/extensions/widget_ext/widget_extensions.dart';
import 'package:innovative_net_test/core/local_storage/app_preferences.dart';
import 'package:innovative_net_test/core/local_storage/hive/hive_service.dart';
import 'package:innovative_net_test/core/themes/app_colors.dart';
import 'package:innovative_net_test/core/widgets/app_image_view.dart';
import 'package:innovative_net_test/core/widgets/text/app_text.dart';
import 'package:innovative_net_test/features/dashboard/presentation/controller/dashboard_controller.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 40.w,
        leading: Builder(
          builder: (context) => AppImageView(
            imagePath: AppImages.drawer,
            color: AppColors.primary,
            imageSize: Size(40, 40),
          ).onViewClick(() => Scaffold.of(context).openDrawer()),
        ),
        title: AppText(
          text: AppStrings.dashboard,
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: AppColors.primary,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: AppImageView(
              imagePath: AppImages.notification,
              color: AppColors.primary,
              imageSize: Size(40, 40),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: AppColors.primary),
              accountName: AppText(
                text: "${controller.userData.value?.name}",
                color: AppColors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              accountEmail: AppText(
                text: "${controller.userData.value?.email}",
                color: AppColors.white,
              ),
              currentAccountPicture: CircleAvatar(
                child: AppImageView(imagePath: AppImages.person),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: AppText(text: "Profile"),
              onTap: () {
                Get.toNamed(AppRoutes.PROFILE);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: AppText(text: "Logout"),
              onTap: () {
                AppPreferences.instance.clearBearerToken();
                HiveService().closeBoxes();
                Get.offAllNamed(AppRoutes.LOGIN);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Obx(
            () => IndexedStack(
              index: controller.currentIndex.value,
              children: controller.pages,
            ),
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.hintColor,
          items: [
            _buildNavBarItem(AppImages.home, 'Home', 0),
            _buildNavBarItem(AppImages.route, 'Route', 1),
            _buildNavBarItem(AppImages.payload, 'Payload', 2),
            _buildNavBarItem(AppImages.history, 'History', 3),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavBarItem(
    String iconPath,
    String label,
    int index,
  ) {
    bool isSelected = controller.currentIndex.value == index;
    return BottomNavigationBarItem(
      icon: AppImageView(
        imagePath: iconPath,
        imageSize: const Size(24, 24),
        color: isSelected ? AppColors.primary : AppColors.hintColor,
      ),
      label: label,
    );
  }
}
