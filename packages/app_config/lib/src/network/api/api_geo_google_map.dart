// Dart imports:
import 'dart:io';

// Package imports:

// Project imports:
import 'package:app_config/src/network/interceptors/header_interceptor.dart';
import 'package:app_config/src/network/log/log.dart';
import 'package:app_config/src/network/params/api_provider_params.dart';

import '../ez_network.dart';
import '../interceptors/mockup_interceptor.dart';

// import '../interceptors/header_interceptor.dart';
// import '../interceptors/telegram_logging_interceptor.dart';

class ApiGeoGoogleMapProvider {
  ApiGeoGoogleMapProvider({
    required this.enableLogger,
    this.enableOnlineLogger = false,
    required this.baseUrl,
    required this.getHeaders,
  }) {
    final BaseOptions dioOptions = BaseOptions()
      ..baseUrl = baseUrl
      ..connectTimeout = const Duration(milliseconds: 20000)
      ..receiveTimeout = const Duration(milliseconds: 30000)
      ..headers = <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'prj_test_pk_86d407435a284ad9f4575a70e62b8a9b1879c360',
      };

    apiDio = Dio(dioOptions);

    //----------------- SET HEADER ------------------//
    apiDio.interceptors.add(HeaderInterceptor(getHeaders));

    //----------------- Telegram log debugging ------//
    // if (enableOnlineLogger) {
    //   apiDio.interceptors.add(TelegramLoggingInterceptor());
    // }

    //----------------- LOGGING ---------------------//
    if (enableLogger) {
      apiDio.interceptors.add(Log.prettyInterceptor);
    }

    //---------------- MOCKUP -------------------//
    if (enableLogger) {
      apiDio.interceptors.add(MockUpInterceptor());
    }
  }
  late Dio apiDio;
  bool enableLogger;
  bool enableOnlineLogger;
  String baseUrl;
  Future<Map<String, dynamic>> Function() getHeaders;
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

      return null;
    }
  }
}
