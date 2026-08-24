// Package imports:
import 'package:app_config/app_config.dart';
import 'package:app_config/src/network/api/api_geo_google_map.dart';
import 'package:app_config/src/network/api/api_upload_provider.dart';
import 'package:app_config/src/network/api/auth/api_auth_provider.dart';

// Project imports:
import 'api_ai_provider.dart';
import 'api_google_map.dart';
import 'api_provider.dart';
import 'api_social_provider.dart';

class ApiNetwork {
  factory ApiNetwork({
    required final bool enableLogger,
    required final Future<Map<String, dynamic>> Function()
    getCollaboratorHeadersApiSocialProvider,
    required final Future<Map<String, dynamic>> Function()
    getHeadersCustomerUploadProvider,
    required final Future<Map<String, dynamic>> Function()
    getHeadersGeoGoogleMapProvider,
    final bool enableOnlineLogger = false,
  }) {
    return ApiNetwork._init(
      enableLogger: enableLogger,
      enableOnlineLogger: enableOnlineLogger,
      getCollaboratorHeadersApiSocialProvider:
          getCollaboratorHeadersApiSocialProvider,
      getHeadersCustomerUploadProvider: getHeadersCustomerUploadProvider,
      getHeadersGeoGoogleMapProvider: getHeadersGeoGoogleMapProvider,
    );
  }

  ApiNetwork._init({
    required this.enableLogger,
    required this.getCollaboratorHeadersApiSocialProvider,
    required this.getHeadersCustomerUploadProvider,
    required this.getHeadersGeoGoogleMapProvider,
    this.enableOnlineLogger = false,
  }) {
    apiAuthProvider = ApiAuthProvider(
      baseUrl: AppConfig.baseAuthUrl,
      enableLogger: enableLogger,
      enableOnlineLogger: enableOnlineLogger,
    );
    collaboratorApiProvider = ApiProvider(
      baseUrl: AppConfig.baseUrl,
      enableLogger: enableLogger,
      enableOnlineLogger: enableOnlineLogger,
    );
    collaboratorUploadProvider = UploadProvider(
      baseUrl: AppConfig.uploadUrl,
      enableLogger: enableLogger,
      enableOnlineLogger: enableOnlineLogger,
    );
    apiGoogleMapProvider = ApiGoogleMapProvider(
      baseUrl: AppConfig.baseGoogleMapUrl,
      enableLogger: enableLogger,
    );
    apiSocialProvider = ApiSocialProvider(
      baseUrl: AppConfig.baseSocialUrl,
      enableLogger: enableLogger,
      getHeaders: getCollaboratorHeadersApiSocialProvider,
      enableOnlineLogger: enableOnlineLogger,
    );
    apiGeoGoogleMapProvider = ApiGeoGoogleMapProvider(
      baseUrl: AppConfig.baseGoogleMapUrl,
      enableLogger: enableLogger,
      getHeaders: getHeadersGeoGoogleMapProvider,
    );
  }

  final bool enableLogger;
  final bool enableOnlineLogger;

  final Future<Map<String, dynamic>> Function()
  getCollaboratorHeadersApiSocialProvider;
  final Future<Map<String, dynamic>> Function()
  getHeadersCustomerUploadProvider;
  final Future<Map<String, dynamic>> Function() getHeadersGeoGoogleMapProvider;
  late ApiProvider collaboratorApiProvider;
  late UploadProvider collaboratorUploadProvider;
  late ApiGoogleMapProvider apiGoogleMapProvider;
  late ApiGeoGoogleMapProvider apiGeoGoogleMapProvider;
  late ApiSocialProvider apiSocialProvider;
  late ApiAiProvider apiAiProvider;
  late ApiAuthProvider apiAuthProvider;
}
