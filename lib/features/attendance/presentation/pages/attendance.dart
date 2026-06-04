import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovative_net_test/core/widgets/base_page.dart';
import 'package:innovative_net_test/features/attendance/presentation/controller/attendance_controller.dart';

class Attendance extends StatelessWidget {
  Attendance({super.key});
  final controller = Get.find<AttendanceController>();

  @override
  Widget build(BuildContext context) {
    return BasePage(
      isScrollEnable: true,
      horizontalSpace: 24,
      child: Column(mainAxisAlignment: .center, children: [
        
        ],
      ),
    );
  }
}
