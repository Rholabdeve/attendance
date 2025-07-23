import 'package:attendance_system_app/resource/constant/assets.dart';
import 'package:attendance_system_app/resource/constant/constant.dart';
import 'package:attendance_system_app/utils/custom.button.dart';
import 'package:attendance_system_app/utils/custom_textfield.dart';
import 'package:attendance_system_app/view_model/controller/login/login.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          controller: controller.emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: (p0) {
                            return controller.emailText;
                          },
                          decoration: const InputDecoration(
                              hintText: 'Enter Email',
                              border: OutlineInputBorder()),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Obx(
                          () => CustomTextFormField(
                            controller: controller.passwordController,
                            obscureText: controller.isObscure.value,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            validator: (p0) {
                              return controller.passwordText;
                            },
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      controller.togglePasswordVisibility();
                                    },
                                    icon: Icon(
                                      controller.isObscure.value
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.grey,
                                    )),
                                hintText: 'Enter Password',
                                border: const OutlineInputBorder()),
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
                  text: AppStrings.LOGIN,
                  isLoading:
                      controller.progressStatus.value == ProgressStatus.loading,
                  isSuccess:
                      controller.progressStatus.value == ProgressStatus.success,
                  onPressed: () {
                    controller.login(
                        email: controller.emailController.text,
                        password: controller.passwordController.text);
                  },
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
