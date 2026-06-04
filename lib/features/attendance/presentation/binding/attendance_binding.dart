import 'package:get/get.dart';
import 'package:innovative_net_test/features/attendance/presentation/controller/attendance_controller.dart';

class AttendanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AttendanceController(), fenix: true);
  }
}
