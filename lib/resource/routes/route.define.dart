import 'package:attendance_system_app/resource/routes/route.name.dart';
import 'package:attendance_system_app/view/dashboard/dashboard.screen.dart';
import 'package:attendance_system_app/view/login/login.screen.dart';
import 'package:attendance_system_app/view/splash/splash.screen.dart';
import 'package:attendance_system_app/view_model/binding/dashboard/dashboard.binding.dart';
import 'package:attendance_system_app/view_model/binding/login/login.binding.dart';
import 'package:attendance_system_app/view_model/binding/splash/splash.binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/default_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class Pages {
  static Transition get _routeTransition => Transition.rightToLeft;
  static Route<dynamic>? onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routes.SPLASH_VIEW:
        return GetPageRoute(
            settings: setting,
            page: () => const SplashPage(),
            binding: SplashBinding(),
            transition: _routeTransition);
      case Routes.LOGIN:
        return GetPageRoute(
            settings: setting,
            page: () => const LoginPage(),
            binding: LoginBinding(),
            transition: _routeTransition);
      case Routes.DASHBOARD:
        return GetPageRoute(
            settings: setting,
            page: () => const DashBoardPage(),
            binding: DashBoardBinding(),
            transition: _routeTransition);
      default:
        return null;
    }
  }
}
