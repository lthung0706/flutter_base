// Package imports:
import 'package:dio/dio.dart';

class HeaderInterceptor extends Interceptor {
  HeaderInterceptor(this.header);

  final Future<Map<String, dynamic>> Function() header;

  @override
  Future<void> onRequest(
    final RequestOptions options,
    final RequestInterceptorHandler handler,
  ) async {
    options.headers.addAll(await header());

    return handler.next(options);
  }
}
