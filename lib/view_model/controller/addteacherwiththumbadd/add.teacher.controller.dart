import 'package:attendance_system_app/model/addteacherTumb.model.dart';
import 'package:attendance_system_app/model/fatchteacher.model.dart';
import 'package:attendance_system_app/repository/addthumbteacher/add.thumb.teacher.dart';
import 'package:attendance_system_app/repository/fatchteacher/fatch.teacher.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ProgressStatus { idle, loading, success, failure }

class ADDTeacherController extends GetxController {
  ADDTeacherController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController employeeId = TextEditingController();
  final TextEditingController employeeFirstName = TextEditingController();
  final TextEditingController employeeLastName = TextEditingController();
  Rx<ProgressStatus> progressStatus = ProgressStatus.idle.obs;
  Rx<bool> isLoading = false.obs;
  RxBool isScanningThumb = false.obs;
  RxBool isThumbScanned = false.obs;

  String? get validateId {
    final text = employeeId.text;
    if (text.isEmpty) {
      return 'Employee ID can\'t be empty';
    }
    return null;
  }

  String? get validateFirstName {
    final text = employeeFirstName.text;
    if (text.isEmpty) {
      return 'First Name can\'t be empty';
    }
    return null;
  }

  String? get validateLastName {
    final text = employeeFirstName.text;
    if (text.isEmpty) {
      return 'Last Name can\'t be empty';
    }
    return null;
  }

  Future<void> fatchteacher({required String empid}) async {
    try {
      progressStatus.value = ProgressStatus.loading;
      isLoading.value = true;
      FatchTeacherModel results =
          await FatchTeacherRepository.fatchTeacherRepo(empId: empid);
      if (results.status == "success") {
        isLoading.value = false;
        progressStatus.value = ProgressStatus.success;
        if (kDebugMode) {
          print("get Teacher data");
        }
        employeeFirstName.text = results.firstname ?? "";
        employeeLastName.text = results.lastname ?? "";
      } else if (results.status == "error") {
        isLoading.value = false;
        Get.snackbar("Error", "Teacher not Found");
      } else {
        isLoading.value = false;
        progressStatus.value = ProgressStatus.failure;
        Get.snackbar("Error", "Teacher not Found");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
        isLoading.value = false;
        progressStatus.value = ProgressStatus.failure;
        Get.snackbar("Message", "Teacher Not Found");
      }
    }
  }

  Future<void> addTeacherThumb({
    required String empid,
    required String firstname,
    required String lastname,
    required String thumbid,
  }) async {
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }

    if (!isThumbScanned.value) {
      Get.snackbar(
        "Message",
        "Scan Required",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    try {
      progressStatus.value = ProgressStatus.loading;
      isLoading.value = true;

      AddThumbTeacher result =
          await AddThumbTeacherRepository.addthumbteacherdata(
        empid: empid,
        firstname: firstname,
        lastname: lastname,
        thumbid: thumbid,
      );

      isLoading.value = false;

      if (result.status == "success") {
        progressStatus.value = ProgressStatus.success;
        if (kDebugMode) {
          print("Thumb data Added");
        }
        Get.back();
        Get.snackbar("Message", "Thumb data submitted successfully");
      } else if (result.status == "error") {
        Get.snackbar("Message", "Something went wrong");
      } else {
        progressStatus.value = ProgressStatus.failure;
        Get.snackbar("Error", "Something went wrong!");
      }
    } catch (e) {
      isLoading.value = false;
      progressStatus.value = ProgressStatus.failure;
      if (kDebugMode) {
        print(e.toString());
      }
      Get.snackbar("Message", "Teacher Already Added");
    }
  }

  Future<void> scanThumb() async {
    isScanningThumb.value = true;
    await Future.delayed(const Duration(seconds: 3));
    isScanningThumb.value = false;
    isThumbScanned.value = true;
  }
}
