// Package imports:
import 'package:app_config/app_config.dart';

import 'package:app_intl/ez_intl.dart';

extension DioHelper on Dio {
  String getErrorMessage(final DioException dioError, AppLocalizations l10n) {
    String errorDescription = l10n.somethingWentWrongTryAgain;
    switch (dioError.type) {
      case DioExceptionType.cancel:
        errorDescription = l10n.requestCancelled;
        break;
      case DioExceptionType.sendTimeout:
        errorDescription = l10n.sendTimeout;
        break;
      case DioExceptionType.receiveTimeout:
        errorDescription = l10n.receiveTimeout;
        break;
      case DioExceptionType.connectionTimeout:
        errorDescription = l10n.connectionTimeout;
        break;
      case DioExceptionType.badResponse:
        errorDescription = l10n.serverStatusCode(
          dioError.response?.statusCode ?? 0,
        );
        break;
      case DioExceptionType.unknown:
      case DioExceptionType.badCertificate:
      case DioExceptionType.connectionError:
        errorDescription = l10n.connectionFailed;
        break;
    }

    return errorDescription;
  }
}
