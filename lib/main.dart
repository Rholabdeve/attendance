import 'package:attendance_system_app/resource/routes/route.define.dart';
import 'package:attendance_system_app/resource/routes/route.name.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:responsive_framework/responsive_framework.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {}
    return GetMaterialApp(
      title: 'Attendance System',
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: ClampingScrollWrapper.builder(context, child!),
        breakpoints: [
          const Breakpoint(start: 0, end: 480, name: MOBILE),
          const Breakpoint(start: 481, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: double.infinity, name: DESKTOP),
        ],
      ),
      onGenerateRoute: Pages.onGenerateRoute,
      initialRoute: Routes.SPLASH_VIEW,
      defaultTransition: Transition.rightToLeft,
      smartManagement: SmartManagement.full,
    );
  }
}
