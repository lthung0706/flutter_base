class ErrorCodes {
  ErrorCodes._();

  static const int success = 1;
  static const int failure = -1;

  //General
  static const int tokenExpired = -15;
  static const int accTokenExpired = 401;
  static const int forceUpdate = -777;
  static const bool accSuccess = true;
  static const int errorCode = 1;
  static const int permissionDenied = 403;
  static const int customerNotFound = -320;
  static const int timeout = 408;
  static const int missingDeviceInfo = -1301;
  static const int invalidCredential = -401;
}
