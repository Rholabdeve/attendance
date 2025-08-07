import 'package:attendance_system_app/data/network/base.api.services.dart';
import 'package:attendance_system_app/data/network/network.api.services.dart';
import 'package:attendance_system_app/model/addteacherTumb.model.dart';
import 'package:attendance_system_app/resource/constant/globals.url.dart';
import 'package:flutter/foundation.dart';

class AddThumbTeacherRepository {
  static BaseNetworkApi apiservices = NetworkApiClass();
  static String addThumbTeacherUrl = Global.ADD_TEACHER_THUMB;
  static String secretKey = Global.SECRET_KEY;

  static Future<AddThumbTeacher> addthumbteacherdata(
      {required String empid,
      required String firstname,
      required String lastname,
      required String thumbid}) async {
    try {
      final response = await apiservices.postApi(addThumbTeacherUrl, {
        "empid": empid,
        "firstname": firstname,
        "lastname": lastname,
        "thumbid": thumbid
      });
      return AddThumbTeacher.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      rethrow;
    }
  }
}
