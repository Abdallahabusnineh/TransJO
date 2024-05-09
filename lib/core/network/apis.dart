abstract class ApisUrl {
  static const String routBaseURL = "https://transapp1.onrender.com/api/";
}

abstract class RoutsURLs {
  static String getAllRouts() {
    return "${ApisUrl.routBaseURL}/routes";
  }

  static String getRoutById(int id) {
    return "${ApisUrl.routBaseURL}/routes/$id";
  }
}
