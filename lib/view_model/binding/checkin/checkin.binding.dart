import 'package:attendance_system_app/view_model/controller/checkin/checkin.controller.dart';
import 'package:get/get.dart';

class CheckInBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckinController());
  }
}
