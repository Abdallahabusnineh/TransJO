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
  //static String login='login';
}
