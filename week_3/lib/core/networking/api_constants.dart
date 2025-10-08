class ApiConstants {
  static const String apiBaseUrl = "https://accessories-eshop.runasp.net/api/";

  static const String apiLogin = "auth/login";
  static const String apiSignup = "auth/register";
  static const String apiVerifyEmail = "auth/verify-email";
  static const String apiResendOtp = "auth/resend-otp";

  static const String apiUserDetails = "auth/me";

  static const String apiProducts = "api/products";
  static const String apiCategories = "api/categories";
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
