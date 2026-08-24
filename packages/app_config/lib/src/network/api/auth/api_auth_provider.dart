// Dart imports:
import 'dart:io';

// Package imports:
import 'package:app_config/src/network/interceptors/mockup_interceptor.dart';
import 'package:app_config/src/network/params/api_provider_params.dart';
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:logarte/logarte.dart';

import '../../../../app_config.dart';

// Project imports:

class ApiAuthProvider {
  ApiAuthProvider({
    required this.enableLogger,
    this.enableOnlineLogger = false,
    required this.baseUrl,
  }) {
    final BaseOptions dioOptions = BaseOptions()
      ..baseUrl = baseUrl
      ..connectTimeout = const Duration(milliseconds: 20000)
      ..receiveTimeout = const Duration(milliseconds: 30000)
      ..headers = <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      };

    apiDio = Dio(dioOptions);

    //----------------- SET HEADER ------------------//
    //apiDio.interceptors.add(HeaderInterceptor(getHeaders));

    //----------------- LOGGING ---------------------//
    if (enableLogger) {
      apiDio.interceptors.add(Log.prettyInterceptor);
      apiDio.interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true));
    }

    //---------------- MOCKUP -------------------//
    if (enableLogger) {
      apiDio.interceptors.add(MockUpInterceptor());
    }

    // ----------------- LOGARTE ---------------------//
    if (enableOnlineLogger) {
      apiDio.interceptors.add(LogarteDioInterceptor(Log.logarte));
    }
  }
  late Dio apiDio;
  bool enableLogger;
  bool enableOnlineLogger;
  String baseUrl;
  String? debuggingUrl;

  // API get:------------------------------------------------------------------
  Future<Map<String, dynamic>?> get(final ApiGetParams params) async {
    if (params.isMockupApi) {
      return MockApi.get(params.uri, queryParameters: params.queryParameters);
    }

    if (params.options != null && params.headers != null) {
      params.options?.headers?.addAll(params.headers ?? <String, dynamic>{});
    } else {
      params.options = Options(headers: params.headers);
    }

    try {
      final Response<dynamic> response = await apiDio.get<dynamic>(
        params.uri,
        queryParameters: params.queryParameters,
        options: params.options,
        cancelToken: params.cancelToken,
        onReceiveProgress: params.onReceiveProgress,
      );

      return response.data as Map<String, dynamic>?;
    } on DioException catch (e) {
      if (e.response?.statusCode == HttpStatus.unauthorized) {
        return <String, dynamic>{
          'error_code': -15,
          'error_message': 'Hết thời gian truy cập, vui lòng đăng nhập lại',
          'message': 'Hết thời gian truy cập, vui lòng đăng nhập lại',
        };
      }
      if (e.response?.data is Map) {
        final res = e.response?.data as Map<String, dynamic>;
        return <String, dynamic>{
          'error_code': res['code'],
          'error_message': res['message'],
          'message': res['message'],
        };
      }
      return null;
    }
  }

  // API post:---------------------------------------------------------
  Future<Map<String, dynamic>?> post(final ApiPostParams params) async {
    if (params.isMockupApi) {
      return MockApi.post(
        params.uri,
        queryParameters: params.queryParameters,
        data: params.data,
      );
    }

    if (params.options != null && params.headers != null) {
      params.options?.headers?.addAll(params.headers ?? <String, dynamic>{});
    } else {
      params.options = Options(headers: params.headers);
    }

    try {
      final Response<dynamic> response = await apiDio.post<dynamic>(
        params.uri,
        data: params.data,
        queryParameters: params.queryParameters,
        options: params.options,
        cancelToken: params.cancelToken,
        onSendProgress: params.onSendProgress,
        onReceiveProgress: params.onReceiveProgress,
      );

      return response.data as Map<String, dynamic>?;
    } on DioException catch (e) {
      if (e.response?.statusCode == HttpStatus.unauthorized) {
        return <String, dynamic>{
          'error_code': 401,
          'error_message': 'Hết thời gian truy cập, vui lòng đăng nhập lại',
          'message': 'Hết thời gian truy cập, vui lòng đăng nhập lại',
        };
      }
      if (e.response?.data is Map) {
        final res = e.response?.data as Map<String, dynamic>;
        return <String, dynamic>{
          'error_code': res['code'],
          'error_message': res['message'],
          'message': res['message'],
        };
      }
      return null;
    }
  }

  Future<Map<String, dynamic>?> put(final ApiPutParams params) async {
    if (params.isMockupApi) {
      return MockApi.post(params.uri);
    }

    if (params.options != null && params.headers != null) {
      params.options?.headers?.addAll(params.headers ?? <String, dynamic>{});
    } else {
      params.options = Options(headers: params.headers);
    }

    try {
      final response = await apiDio.put<dynamic>(
        params.uri,
        data: params.data,
        queryParameters: params.queryParameters,
        options: params.options,
        cancelToken: params.cancelToken,
        onSendProgress: params.onSendProgress,
        onReceiveProgress: params.onReceiveProgress,
      );

      return response.data as Map<String, dynamic>?;
    } on DioException catch (e) {
      if (e.response?.statusCode == HttpStatus.unauthorized) {
        return <String, dynamic>{
          'error_code': 401,
          'error_message': 'Hết thời gian truy cập, vui lòng đăng nhập lại',
          'message': 'Hết thời gian truy cập, vui lòng đăng nhập lại',
        };
      }
      if (e.response?.data is Map) {
        final res = e.response?.data as Map<String, dynamic>;
        return <String, dynamic>{
          'error_code': res['code'],
          'error_message': res['message'],
          'message': res['message'],
        };
      }
      return null;
    }
  }
}
