import 'package:flutter_dotenv/flutter_dotenv.dart';
// ignore_for_file: non_constant_identifier_names

class Global {
  static String SECRET_KEY = dotenv.env['SECRET_KEY'] ?? '';
  static String BASE_URL = dotenv.env['Base_Url'] ?? '';
  static String loginUrl = '$BASE_URL/api/check-auth';
  static String FETCH_TEACHER = '$BASE_URL/api/fetch-teacher';
}
