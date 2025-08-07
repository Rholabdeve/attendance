import 'package:attendance_system_app/model/get.teacher.name.dart';
import 'package:attendance_system_app/resource/constant/assets.dart';
import 'package:attendance_system_app/resource/constant/constant.dart';
import 'package:attendance_system_app/view_model/controller/checkin/checkin.controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckInPage extends GetView<CheckinController> {
  const CheckInPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(title: const Text('CheckIn')),
        body: Form(
          key: controller.formKey,
          child: Column(
            children: [
              Obx(() {
                final selectedTeacher = controller.popName.firstWhereOrNull(
                  (e) => e.empid == controller.selectedTeacherId.value,
                );

                final selectedValue = selectedTeacher?.empid;

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: screenHeight * 0.077,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38, width: 1),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          hint: const Text(AppStrings.SELECT_NAME),
                          isExpanded: true,
                          value: selectedValue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: controller.popName.isNotEmpty
                              ? controller.popName.map((Data name) {
                                  return DropdownMenuItem<String>(
                                    alignment: Alignment.centerLeft,
                                    value: name.empid,
                                    child: Text(
                                        "${name.firstname} ${name.lastname}"),
                                  );
                                }).toList()
                              : [
                                  const DropdownMenuItem<String>(
                                    value: '',
                                    child: Text(AppStrings.NO_TEACHER_ASSIGN),
                                  ),
                                ],
                          onChanged: (newValue) {
                            if (newValue != null) {
                              controller.selectedTeacherId.value = newValue;
                              if (kDebugMode) {
                                controller.selectedvalue = controller.popName
                                    .firstWhereOrNull(
                                        (e) => e.empid == newValue);
                                print("Selected ID: $newValue");
                                print(
                                    "Name: ${controller.selectedvalue?.firstname} ${controller.selectedvalue?.lastname}");
                                print(
                                    "ThumbID: ${controller.selectedvalue?.thumbid}");
                              }
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                );
              }),
              const SizedBox(height: 10.0),
              Obx(() {
                final isLoading = controller.isLoading.value;

                return Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: GestureDetector(
                    onTap: isLoading
                        ? null
                        : () async {
                            if (controller.selectedvalue != null) {
                              await controller.checkin(
                                empid: controller.selectedvalue?.empid ?? "",
                                thumbid: controller.selectedvalue?.thumbid ??
                                    'false',
                              );
                            }
                          },
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
                        child: isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : Image.asset(
                                Assets.FINGURE,
                                fit: BoxFit.contain,
                              ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ));
  }
}
