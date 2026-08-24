// Package imports:
import 'package:app_config/app_config.dart';
import 'package:retrofit/retrofit.dart';

// Project imports:
import '../error/api_error.dart';

extension HttpResponseHelper on HttpResponse<dynamic> {
  DioException get dioError => DioException(
    error: response.statusMessage,
    response: response,
    requestOptions: response.requestOptions,
    type: DioExceptionType.badResponse,
  );
  ApiError get apiError =>
      ApiError(code: response.statusCode, message: response.statusMessage);
}
