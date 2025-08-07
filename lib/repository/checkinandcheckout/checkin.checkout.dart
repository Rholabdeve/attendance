import 'package:attendance_system_app/data/network/base.api.services.dart';
import 'package:attendance_system_app/data/network/network.api.services.dart';
import 'package:attendance_system_app/model/checkIn.checkout.model.dart';
import 'package:attendance_system_app/resource/constant/globals.url.dart';
import 'package:flutter/foundation.dart';

class CheckInAndCheckOutRepo {
  static BaseNetworkApi networkApi = NetworkApiClass();
  static String teachernameurl = Global.TEACHER_ATTENDANCE;
  static Future<CheckInandCheckout> markattendance(
      {required String empid, required String thumbid}) async {
    try {
      final response = await networkApi.postApi(teachernameurl, {
        "empid": empid,
        "thumbid": thumbid,
      });
      return CheckInandCheckout.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      rethrow;
    }
  }
}
