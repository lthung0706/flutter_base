// Package imports:

// Project imports:
import 'package:app_config/app_config.dart';

import '../error/api_error.dart';
import '../error/api_error_data.dart';

extension DioResponseHelpers on Response<dynamic> {
  ApiError get apiError {
    if (data is Map) {
      return ApiError(
        code: int.tryParse((data as Map)['code'].toString()),
        message: (data as Map)['message']?.toString(),
        externalCode: int.tryParse((data as Map)['externalCode'].toString()),
        externalMessage: (data as Map)['externalMessage']?.toString(),
        data: (data as Map)['data'] == null || (data as Map)['data'] is! Map
            ? null
            : ApiErrorData.fromJson(
                (data as Map)['data'] as Map<String, dynamic>,
              ),
      );
    }

    return ApiError(code: statusCode, message: null);
  }
}
