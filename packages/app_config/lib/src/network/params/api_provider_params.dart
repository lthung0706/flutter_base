// Project imports:
import 'package:dio/dio.dart';

class ApiGetParams {
  ApiGetParams(
    this.uri, {
    this.queryParameters,
    this.headers,
    this.options,
    this.cancelToken,
    this.onReceiveProgress,
    this.isMockupApi = false,
  });

  final String uri;
  final Map<String, dynamic>? queryParameters;
  final Map<String, dynamic>? headers;
  Options? options;
  final CancelToken? cancelToken;
  final ProgressCallback? onReceiveProgress;
  final bool isMockupApi;
}

class ApiPostParams {
  ApiPostParams(
    this.uri, {
    this.data,
    this.queryParameters,
    this.headers,
    this.options,
    this.cancelToken,
    this.onSendProgress,
    this.onReceiveProgress,
    this.isMockupApi = false,
  });

  final String uri;
  final dynamic data;
  final Map<String, dynamic>? queryParameters;
  final Map<String, dynamic>? headers;
  Options? options;
  final CancelToken? cancelToken;
  final ProgressCallback? onSendProgress;
  final ProgressCallback? onReceiveProgress;
  final bool isMockupApi;
}

class ApiPutParams {
  ApiPutParams(
    this.uri, {
    this.data,
    this.queryParameters,
    this.headers,
    this.options,
    this.cancelToken,
    this.onSendProgress,
    this.onReceiveProgress,
    this.isMockupApi = false,
  });

  final String uri;
  final dynamic data;
  final Map<String, dynamic>? queryParameters;
  final Map<String, dynamic>? headers;
  Options? options;
  final CancelToken? cancelToken;
  final ProgressCallback? onSendProgress;
  final ProgressCallback? onReceiveProgress;
  final bool isMockupApi;
}
