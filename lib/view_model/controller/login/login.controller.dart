import 'package:attendance_system_app/model/login.model.dart';
import 'package:attendance_system_app/repository/login/login.repo.dart';
import 'package:attendance_system_app/view_model/controller/session/session.controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ProgressStatus { idle, loading, success, failure }

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final RxBool isObscure = true.obs;
  Rx<ProgressStatus> progressStatus = ProgressStatus.idle.obs;
  LoginController();
  Rx<bool> isLoading = false.obs;

  void togglePasswordVisibility() {
    isObscure.value = !isObscure.value;
  }

  String? get emailText {
    final text = emailController.text;
    if (text.isEmpty) {
      return 'Email can\'t be empty';
    }
    return null;
  }

  String? get passwordText {
    final text = passwordController.text;
    if (text.isEmpty) {
      return 'Password can\'t be empty';
    }
    return null;
  }

  Future<LoginModel?> login(
      {required String email, required String password}) async {
    try {
      isLoading.value = true;
      await Future.delayed(Duration.zero);
      LoginModel response = await LoginRepository.login(email, password);
      if (response.status == "success") {
        isLoading.value = false;
        final session = SessionController.instance;
        session.setSession(response.data?.id);
        if (kDebugMode) {
          print(response.data?.id);
        }
        progressStatus.value = ProgressStatus.success;
        if (kDebugMode) {
          print("Go to Dashboard");
        }
        return response;
      } else {
        isLoading.value = false;
        progressStatus.value = ProgressStatus.failure;
        Get.snackbar('Login Failed', response.message ?? "Unknown error");
        return null;
      }
    } catch (e) {
      isLoading.value = false;
      progressStatus.value = ProgressStatus.failure;
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return null;
  }
}
