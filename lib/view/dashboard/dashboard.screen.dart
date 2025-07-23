import 'package:attendance_system_app/view_model/controller/dashboard/dashboard.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardPage extends GetView<DashboardController> {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('DashBoard')),
        body: const SafeArea(child: Text('MyController')));
  }
}
