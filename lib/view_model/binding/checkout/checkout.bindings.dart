import 'package:attendance_system_app/view_model/controller/checkout/checkout.cotroller.dart';
import 'package:get/get.dart';

class CheckOutBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckoutController());
  }
}
