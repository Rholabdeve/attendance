import 'package:attendance_system_app/model/checkIn.checkout.model.dart';
import 'package:attendance_system_app/model/get.teacher.name.dart';
import 'package:attendance_system_app/repository/checkin/get.teacher.name.dart';
import 'package:attendance_system_app/repository/checkinandcheckout/checkin.checkout.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ProgressStatus { idle, loading, success, failure }

class CheckoutController extends GetxController {
  CheckoutController();
  Rx<ProgressStatus> progressStatus = ProgressStatus.idle.obs;
  Rx<bool> isLoading = false.obs;
  Data? selectedcheckout;
  RxString checkoutselectedTeacherId = ''.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController employeeCheckOutId = TextEditingController();
  RxList<Data> checkoutpopName = <Data>[].obs;
  String? get validateID {
    final text = employeeCheckOutId.text;
    if (text.isEmpty) {
      return 'Employee Id can\'t be empty';
    }
    return null;
  }

  Future<void> teacherName() async {
    try {
      progressStatus.value = ProgressStatus.loading;
      TeacherName results = await GetNameTeacherRepo.getNameRepo();
      if (results.status == "success") {
        progressStatus.value = ProgressStatus.success;
        final seenEmpIds = <String>{};
        final uniqueList = (results.data ?? []).where((teacher) {
          return seenEmpIds.add(teacher.empid ?? "");
        }).toList();

        checkoutpopName.value = uniqueList;
      } else {
        progressStatus.value = ProgressStatus.failure;
        Get.snackbar("Message", "${results.message}");
      }
    } catch (e) {
      progressStatus.value = ProgressStatus.failure;
      if (kDebugMode) {
        print("Error fetching journey data: $e");
      }
      Get.snackbar("Error", "Something went wrong");
    }
  }

  Future<void> checkout(
      {required String empid, required String thumbid}) async {
    try {
      progressStatus.value = ProgressStatus.loading;
      isLoading.value = true;
      CheckInandCheckout results = await CheckInAndCheckOutRepo.markattendance(
          empid: empid, thumbid: thumbid);
      if (results.status == "success") {
        isLoading.value = false;
        progressStatus.value = ProgressStatus.success;
        Get.snackbar("Message", results.message.toString());
      } else {
        isLoading.value = false;
        progressStatus.value = ProgressStatus.failure;
        Get.snackbar("Error", results.message.toString());
      }
    } catch (e) {
      isLoading.value = false;
      progressStatus.value = ProgressStatus.failure;
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  @override
  void onInit() {
    teacherName();
    super.onInit();
  }
}
