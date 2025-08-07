import 'package:attendance_system_app/data/network/base.api.services.dart';
import 'package:attendance_system_app/data/network/network.api.services.dart';
import 'package:attendance_system_app/model/get.teacher.name.dart';
import 'package:attendance_system_app/resource/constant/globals.url.dart';
import 'package:flutter/foundation.dart';

class GetNameTeacherRepo {
  static BaseNetworkApi networkApi = NetworkApiClass();
  static String teachernameurl = Global.TEACHER_NAME;

  static Future<TeacherName> getNameRepo() async {
    try {
      final response = await networkApi.postApi(teachernameurl, {});
      return TeacherName.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      rethrow;
    }
  }
}
