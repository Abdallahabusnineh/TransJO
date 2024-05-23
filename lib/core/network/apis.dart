abstract class ApisUrl {
  static const String baseURL = "https://tran-4rhc.onrender.com";
}

abstract class AppURLs {
  static String getAllRouts() {
    return "${ApisUrl.baseURL}/api/route/routes";
  }

  static String getRoutById(int id) {
    return "${ApisUrl.baseURL}/api/route/routes/$id";
  }

  static String getAllFavRoute() {
    return "${ApisUrl.baseURL}/api/route/favoriteRoutes";
  }

  static String favoriteRoute(int id) {
    return "${ApisUrl.baseURL}/api/route/FavoriteRoute/$id";
  }

  static String getBusLocation(int id) {
    return "${ApisUrl.baseURL}/api/user/bus/$id/location";
  }

  static String userLogin = '/api/user/login';
  static String userRegister = '/api/user/register';
  static String forgotPassword = '/api/user/reset-password';
  static String verificationCode = '/api/user/change-password';
  static String changePasswordSendCode = '/api/user/app-reset-password';
  static String changePasswordVerificationCode =
      '/api/user/app-change-password';
  static String changePasswordUpdated = '/api/user/app-change-password3';
  static String feedBack = '/api/user/report';
  static String logout = '/logout';
  static String userDetails = '/api/user/details';
}
