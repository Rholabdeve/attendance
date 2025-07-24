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
}
