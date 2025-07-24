import 'package:attendance_system_app/view_model/controller/addteacher/add.teacher.controller.dart';
import 'package:get/get.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ADDTeacherController());
  }
}
