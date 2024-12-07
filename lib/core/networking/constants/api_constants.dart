class ApiConstants {
  static const String baserUrl = "https://sherif-saoudy.com/api";
  static const String login = "/login";
  static const String register = "/register";
  static const String sendOtp = "/resend_otp";
  static const String verifyOtp = "/code_verified";
  static const String policy = "/policy";
  static const String search = "/crops";
  static const String purchase = "/purchase";
  static const String sell = "/sell";
  static const String partners = "/partners";
  static const String changePassword = "/password/change";
  static const String logout = "/user/logout";
  static const String complaint = "/complaint";
  static const String technicalSupport = "/contact";
  static const String getProfile = "/user/get-profile";
  static const String updateNewPasswordProfile = "/user/change-password";
  static const String cities = "/cities";
  static const String store = "/crops";



  static  bool valid = false;
}

class ApiKey {
  static String id = "id";
  static String name = "name";
  static String phone = "phone";
  static String authorization = "Authorization";
  static String status = "status";
  static String message = "msg";
  static String data = "data";
  static String img = "img";
  static String password = "password";
  static String language = "language";
  static String job = "job";
}
class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}