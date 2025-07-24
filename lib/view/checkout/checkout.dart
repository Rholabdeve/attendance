import 'package:attendance_system_app/resource/constant/assets.dart';
import 'package:attendance_system_app/utils/custom_textfield.dart';
import 'package:attendance_system_app/view_model/controller/checkout/checkout.cotroller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutPage extends GetView<CheckoutController> {
  const CheckOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Checkout ')),
        body: Form(
          key: controller.formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomTextFormField(
                  controller: controller.employeeCheckInId,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (p0) {
                    return controller.validateID;
                  },
                  decoration: const InputDecoration(
                      hintText: 'Enter Employee ID',
                      border: OutlineInputBorder()),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: DottedBorder(
                  color: Colors.grey,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  dashPattern: const [8, 4],
                  strokeWidth: 2,
                  child: Container(
                    height: 150,
                    width: 150,
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(
                      Assets.FINGURE,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
