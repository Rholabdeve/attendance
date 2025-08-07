import 'package:attendance_system_app/resource/constant/assets.dart';
import 'package:attendance_system_app/resource/constant/constant.dart';
import 'package:attendance_system_app/resource/routes/route.name.dart';
import 'package:attendance_system_app/view_model/controller/dashboard/dashboard.controller.dart';
import 'package:attendance_system_app/view_model/controller/session/session.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardPage extends GetView<DashboardController> {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Image(
            height: 50,
            fit: BoxFit.contain,
            image: AssetImage(Assets.DISTRHO_LOGO),
          ),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 7, 4, 236),
                      Color.fromARGB(255, 159, 201, 236)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Welcome',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {
                  SessionController.instance.clearSession();
                  Get.offAllNamed(Routes.LOGIN);
                },
              ),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  switch (index) {
                    case 0:
                      Get.toNamed(Routes.ADDTEACHER);
                    case 1:
                      Get.toNamed(Routes.CHECKIN);
                    case 2:
                      Get.toNamed(Routes.CHECKOUT);
                  }
                },
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadowColor: Colors.black.withOpacity(0.3),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 7, 4, 236),
                          Color.fromARGB(255, 159, 201, 236)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            AppList.DASHBOARDLIST[index],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ));
  }
}
