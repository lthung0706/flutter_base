// Package imports:

import 'package:app_config/app_config.dart';
import 'package:sstrip/src/authentication/usecase/get_user_usecase.dart';
import 'package:sstrip/src/core/session/session_guard.dart';
import 'package:sstrip/src/module/injector.dart';

class HeaderInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    final RequestOptions options,
    final RequestInterceptorHandler handler,
  ) async {
    final user = await getIt<GetUserUsecase>().call();
    final headers = <String, dynamic>{'Authorization': '${user?.accessToken}'};
    options.headers.addAll(headers);

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    Log.error(handler);
    Log.error(err);

    if (err.response?.statusCode == 401) {
      final auth = err.requestOptions.headers['Authorization']?.toString();
      final hadToken = auth != null && auth.isNotEmpty && auth != 'null';
      if (hadToken) {
        SessionGuard.handleUnauthorized();
      }
    }

    return handler.next(err);
  }
}
