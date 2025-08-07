import 'package:attendance_system_app/data/network/base.api.services.dart';
import 'package:attendance_system_app/data/network/network.api.services.dart';
import 'package:attendance_system_app/model/login.model.dart';
import 'package:attendance_system_app/resource/constant/globals.url.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class LoginRepository {
  static BaseNetworkApi apiService = NetworkApiClass();
  static String secretkey = Global.SECRET_KEY;
  static String loginApi = Global.loginUrl;
  static Future<LoginModel> loginRepo(
    String userEmail,
    String password,
  ) async {
    try {
      final response = await apiService
          .postApi(loginApi, {"email": userEmail, 'password': password});
      if (kDebugMode) {
        print("login Respone  $response");
        print("Email  $userEmail");
        print("password  $password");
      }
      if (response['status'] == 'error') {
        final message = response['message'] ?? 'Login failed';
        throw Exception(message);
      }

      return LoginModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      Get.snackbar("url", loginApi);
      rethrow;
    }
  }
}
