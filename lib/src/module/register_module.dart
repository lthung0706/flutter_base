import 'package:app_config/app_config.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:injectable/injectable.dart';
import 'package:sstrip/src/authentication/auth_api_service.dart';
import 'package:sstrip/src/authentication/interception_auth.dart';
import 'package:sstrip/src/core/session/session_guard.dart';
import 'package:sstrip/src/data/datasources/remote/billing_product_api_service.dart';
import 'package:sstrip/src/data/datasources/remote/upload_api_service.dart';
import 'package:sstrip/src/mapper/mappers.dart';
import 'package:sstrip/src/module/api_helper.dart';
import 'package:sstrip/src/module/injector.dart';
import 'package:sstrip/src/routes/page_routes/home_routes.dart';

const String kApiDio = 'ApiDio';
const String kApiBaseUrl = 'ApiBaseUrl';

const String kApiAuthProviderDio = 'ApiAuthProviderDio';
const String kApiAuthProviderBaseUrl = 'ApiAuthProviderBaseUrl';

const String kStaticApiDio = 'StaticApiDio';
const String kStaticApiBaseUrl = 'StaticApiBaseUrl';

const String kApiSocialDio = 'ApiSocialDio';
const String kApiSocialBaseUrl = 'ApiSocialBaseUrl';

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

  @Named(kApiAuthProviderDio)
  Dio get apiAuthProviderDio =>
      getIt<ApiNetwork>().collaboratorApiProvider.apiDio
        ..interceptors.add(HeaderInterceptor());
  @Named(kApiAuthProviderBaseUrl)
  String get apiAuthProviderBaseUrl =>
      getIt<ApiNetwork>().collaboratorApiProvider.apiDio.options.baseUrl;

  @Named(kApiSocialDio)
  Dio get collaboratorApiSocialDio =>
      getIt<ApiNetwork>().apiSocialProvider.apiDio;
  @Named(kApiSocialBaseUrl)
  String get collaboratorApiSocialBaseUrl =>
      getIt<ApiNetwork>().apiSocialProvider.apiDio.options.baseUrl;

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
  GraphQLNetwork get graphQLNetwork => GraphQLNetwork(
    enableLogger: true,
    baseUrl: 'https://api.example.com/graphql',
    getHeaders: () async => <String, dynamic>{},
    enableOnlineLogger: false,
  );

  @lazySingleton
  SocketNetwork get socketNetwork => SocketNetwork(
    enableLogger: true,
    getChatHeadersProvider: <String, dynamic>{},
    enableOnlineLogger: false,
    eventControllers: getMapStream(),
  );

  @lazySingleton
  GrpcNetwork get grpcNetwork => GrpcNetwork(
    enableLogger: true,
    headersProvider: <String, dynamic>{},
    enableOnlineLogger: false,
  );

  @lazySingleton
  GrpcManager get grpcManager => GrpcManager();

  @lazySingleton
  AuthInterceptor get authInterceptor =>
      AuthInterceptor(getToken: getCollaboratorHeaders);

  @lazySingleton
  AuthApiService collaboratorAuthApiService(
    @Named(kApiAuthProviderDio) final Dio dio,
    @Named(kApiAuthProviderBaseUrl) final String url,
  ) => AuthApiService(dio, baseUrl: url);

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
