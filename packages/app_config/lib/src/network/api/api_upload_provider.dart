// Package imports:
import 'package:app_config/src/network/log/log.dart';
import 'package:dio/dio.dart';
import 'package:logarte/logarte.dart';

// Project imports:

class UploadProvider {
  UploadProvider({
    required this.enableLogger,
    required this.baseUrl,
    required this.enableOnlineLogger,
  }) {
    imageDio = Dio()
      ..options.baseUrl = baseUrl!
      ..options.connectTimeout = const Duration(milliseconds: 20000)
      ..options.receiveTimeout = const Duration(milliseconds: 60000)
      ..options.queryParameters
      ..options.headers = <String, String>{
        'content-type': 'multipart/form-data',
      }
      ..options.headers = <String, String>{
        'boundary': '----WebKitFormBoundary7MA4YWxkTrZu0gW',
      }
      ..interceptors.add(
        enableLogger ? Log.prettyInterceptor : InterceptorsWrapper(),
      );

    // ----------------- LOGARTE ---------------------//
    if (enableOnlineLogger) {
      imageDio.interceptors.add(LogarteDioInterceptor(Log.logarte));
    }
  }

  bool enableLogger = false;
  bool enableOnlineLogger;
  String? baseUrl;
  late Dio imageDio;
}
