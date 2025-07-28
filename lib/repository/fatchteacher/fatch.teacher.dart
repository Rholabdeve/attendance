import 'package:attendance_system_app/data/network/base.api.services.dart';
import 'package:attendance_system_app/data/network/network.api.services.dart';
import 'package:attendance_system_app/model/fatchteacher.model.dart';
import 'package:attendance_system_app/resource/constant/globals.url.dart';
import 'package:flutter/foundation.dart';

class FatchTeacherRepository {
  static BaseNetworkApi apiservices = NetworkApiClass();
  static String fatchteacherEndPoint = Global.FETCH_TEACHER;
  static String secretkey = Global.SECRET_KEY;

  static Future<FatchTeacherModel> fatchTeacherRepo({String? empId}) async {
    try {
      final response = await apiservices.postApi(fatchteacherEndPoint, {
        "empid": empId ?? "0",
      });
      return FatchTeacherModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      rethrow;
    }
  }
}
