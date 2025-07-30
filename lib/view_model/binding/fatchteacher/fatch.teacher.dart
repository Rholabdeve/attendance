import 'package:attendance_system_app/view_model/controller/addteacherwiththumbadd/add.teacher.controller.dart';
import 'package:get/get.dart';

class FatchteacherBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ADDTeacherController());
  }
}
