abstract class ApisUrl {
  static const String baseURL = "https://tran-4rhc.onrender.com/api";
}

abstract class AppURLs {
  static String getAllRouts() {
    return "${ApisUrl.baseURL}/routes";
  }

  static String getRoutById(int id) {
    return "${ApisUrl.baseURL}/routes/$id";
  }
  static String userLogin='/user/login';
  static String userRegister='/user/register';
  static String forgotPassword='/user/reset-password';
  static String verificationCode='/user/change-password';
  static String changePasswordSendCode='/user/app-reset-password';
  static String feedBack='/user/report';

}
