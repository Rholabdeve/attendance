import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckinController extends GetxController {
  CheckinController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController employeeCheckInId = TextEditingController();
  String? get validateID {
    final text = employeeCheckInId.text;
    if (text.isEmpty) {
      return 'Employee Id can\'t be empty';
    }
    return null;
  }
}
