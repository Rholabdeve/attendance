// ignore_for_file: non_constant_identifier_names

class Global {
  static String SECRET_KEY = "ThePublicanSecretKey";
  static String BASE_URL = "https://thepublicanschool.com";
  static String loginUrl = '$BASE_URL/api/check-auth';
  static String FETCH_TEACHER = '$BASE_URL/api/fetch-teacher';
  static String ADD_TEACHER_THUMB = '$BASE_URL/api/submit-teacher-thumb';
  static String TEACHER_NAME = '$BASE_URL/api/fetchteacherdataforattandence';
  static String TEACHER_ATTENDANCE = '$BASE_URL/api/submit-teacher-attandence';
}
