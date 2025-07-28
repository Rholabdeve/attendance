import 'package:attendance_system_app/model/fatchteacher.model.dart';
import 'package:attendance_system_app/repository/fatchteacher/fatch.teacher.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
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
}
