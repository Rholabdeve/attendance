import 'dart:async';
import 'package:attendance_system_app/resource/routes/route.name.dart';
import 'package:attendance_system_app/view_model/controller/session/session.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadSession();
    });
  }

  Timer? _timer;
  Future<void> _loadSession() async {
    final session = SessionController.instance;
    await session.loadSession();
    session
        .loadSession()
        .then((value) => _timer = Timer(const Duration(seconds: 1), () {
              if (session.userSession.data!.id != null) {
                Get.snackbar("Dashboard", "screen");
              } else {
                Get.toNamed(Routes.LOGIN);
              }
            }));
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
