abstract class ApisUrl {
  static const String baseURL = "https://tran-4rhc.onrender.com";
}

abstract class AppURLs {
  static String getAllRouts() {
    return "${ApisUrl.baseURL}/route/routes";
  }
  static String getRoutById(int id) {
    return "${ApisUrl.baseURL}/route/routes/$id";
  }
  static String userLogin='/api/user/login';
  static String userRegister='/api/user/register';
  static String forgotPassword='/api/user/reset-password';
  static String verificationCode='/api/user/change-password';
  static String changePasswordSendCode='/api/user/app-reset-password';
  static String changePasswordVerificationCode='/api/user/app-change-password';
  static String changePasswordUpdated='/api/user/app-change-password3';
  static String feedBack='/api/user/report';
  static String logout='/logout';

}
