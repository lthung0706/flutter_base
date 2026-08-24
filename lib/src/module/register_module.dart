import 'package:app_config/app_config.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:injectable/injectable.dart';
import 'package:report_person/src/authentication/interception_auth.dart';
import 'package:report_person/src/core/session/session_guard.dart';
import 'package:report_person/src/data/datasources/remote/billing_product_api_service.dart';
import 'package:report_person/src/data/datasources/remote/upload_api_service.dart';
import 'package:report_person/src/mapper/mappers.dart';
import 'package:report_person/src/module/api_helper.dart';
import 'package:report_person/src/module/injector.dart';
import 'package:report_person/src/routes/page_routes/home_routes.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

const String kApiDio = 'ApiDio';
const String kApiBaseUrl = 'ApiBaseUrl';

const String kStaticApiDio = 'StaticApiDio';
const String kStaticApiBaseUrl = 'StaticApiBaseUrl';

const String kApiUploadDio = 'ApiUploadDio';
const String kApiUploadBaseUrl = 'ApiUploadBaseUrl';

@module
abstract class RegisterModule {
  @Named(kApiDio)
  Dio get collaboratorApiDio =>
      getIt<ApiNetwork>().collaboratorApiProvider.apiDio
        ..interceptors.add(HeaderInterceptor());
  @Named(kApiBaseUrl)
  String get collaboratorApiBaseUrl =>
      getIt<ApiNetwork>().collaboratorApiProvider.apiDio.options.baseUrl;

  @Named(kStaticApiDio)
  Dio get collaboratorStaticApiDio =>
      getIt<ApiNetwork>().collaboratorUploadProvider.imageDio;
  @Named(kStaticApiBaseUrl)
  String get collaboratorStaticApiBaseUrl =>
      getIt<ApiNetwork>().collaboratorUploadProvider.imageDio.options.baseUrl;

  @Named(kApiUploadDio)
  Dio get uploadApiDio =>
      getIt<ApiNetwork>().collaboratorUploadProvider.imageDio
        ..interceptors.add(HeaderInterceptor());
  @Named(kApiUploadBaseUrl)
  String get uploadApiBaseUrl =>
      getIt<ApiNetwork>().collaboratorUploadProvider.imageDio.options.baseUrl;

  @lazySingleton
  FirebaseAnalytics get firebaseAnalytics => FirebaseAnalytics.instance;

  @lazySingleton
  FirebasePerformance get firebasePerformance => FirebasePerformance.instance;

  @lazySingleton
  GoRouter get goRouter => GoRouter(
    navigatorKey: rootNavigatorKey,
    routes: $appRoutes,
    observers: [
      FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
    ],
  );

  @lazySingleton
  Mapper get mapper => Mapper();

  @lazySingleton
  ApiNetwork get apiNetwork => ApiNetwork(
    enableLogger: true,
    getCollaboratorHeadersApiSocialProvider: () async => <String, dynamic>{},
    getHeadersCustomerUploadProvider: () async => <String, dynamic>{},
    getHeadersGeoGoogleMapProvider: getCollaboratorGeoGoogleMapHeaders,
    enableOnlineLogger: false,
  );

  @lazySingleton
  SupabaseNetwork get supabaseNetwork => SupabaseNetwork(
    enableLogger: AppConfig.isDebug,
    url: AppConfig.supabaseUrl,
    anonKey: AppConfig.supabaseAnonKey,
  );

  @lazySingleton
  SupabaseProvider get supabaseProvider =>
      getIt<SupabaseNetwork>().supabaseProvider;

  @lazySingleton
  sb.SupabaseClient get supabaseClient =>
      getIt<SupabaseNetwork>().supabaseProvider.client;

  @lazySingleton
  UploadApiService uploadApiService(
    @Named(kApiUploadDio) final Dio dio,
    @Named(kApiUploadBaseUrl) final String url,
  ) => UploadApiService(dio, baseUrl: url);

  @lazySingleton
  BillingProductApiService billingProductApiService(
    @Named(kApiDio) final Dio dio,
    @Named(kApiBaseUrl) final String url,
  ) => BillingProductApiService(dio, baseUrl: url);

  @lazySingleton
  InAppPurchase get inAppPurchase => InAppPurchase.instance;
}
