import 'package:attendance_system_app/resource/constant/assets.dart';
import 'package:attendance_system_app/resource/constant/constant.dart';
import 'package:attendance_system_app/utils/custom.button.dart';
import 'package:attendance_system_app/utils/custom_textfield.dart';
import 'package:attendance_system_app/view_model/controller/addteacher/add.teacher.controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ADDTeacherPage extends GetView<ADDTeacherController> {
  const ADDTeacherPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ADDTeacherController());
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(Assets.DISTRHO_LOGO),
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CustomTextFormField(
                          controller: controller.employeeId,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: (p0) {
                            return controller.validateId;
                          },
                          decoration: const InputDecoration(
                              hintText: 'Enter Employee ID',
                              border: OutlineInputBorder()),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CustomTextFormField(
                          controller: controller.employeeFirstName,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: (p0) {
                            return controller.validateFirstName;
                          },
                          decoration: const InputDecoration(
                              hintText: 'Enter Employee First Name',
                              border: OutlineInputBorder()),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CustomTextFormField(
                          controller: controller.employeeLastName,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          validator: (p0) {
                            return controller.validateLastName;
                          },
                          decoration: const InputDecoration(
                              hintText: 'Enter Employee Last Name',
                              border: OutlineInputBorder()),
                        ),
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
                ),
              ),
            ),
          ),
          Obx(
            () => Container(
              width: double.maxFinite,
              margin: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 4,
                    offset: Offset(4, 8),
                  ),
                ],
              ),
              child: CustomButton(
                  buttonColor: const Color(0xff00008B),
                  text: AppStrings.SUBMIT,
                  isLoading:
                      controller.progressStatus.value == ProgressStatus.loading,
                  isSuccess:
                      controller.progressStatus.value == ProgressStatus.success,
                  onPressed: () {},
                  style: TextStyle(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 18)),
            ),
          ),
          const SizedBox(
            height: 10.0,
          )
        ],
      ),
    );
  }
}
