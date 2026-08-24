// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_config/app_config.dart' as _i651;
import 'package:firebase_analytics/firebase_analytics.dart' as _i398;
import 'package:firebase_performance/firebase_performance.dart' as _i346;
import 'package:get_it/get_it.dart' as _i174;
import 'package:go_router/go_router.dart' as _i583;
import 'package:in_app_purchase/in_app_purchase.dart' as _i690;
import 'package:injectable/injectable.dart' as _i526;
import 'package:sstrip/src/authentication/auth_api_service.dart' as _i621;
import 'package:sstrip/src/authentication/auth_repository.dart' as _i263;
import 'package:sstrip/src/authentication/bloc/authentication_bloc.dart'
    as _i812;
import 'package:sstrip/src/authentication/usecase/add_user_usecase.dart' as _i1;
import 'package:sstrip/src/authentication/usecase/check_logined_usecase.dart'
    as _i365;
import 'package:sstrip/src/authentication/usecase/delete_user_usecase.dart'
    as _i665;
import 'package:sstrip/src/authentication/usecase/get_user_usecase.dart'
    as _i72;
import 'package:sstrip/src/authentication/usecase/login_apple_usecase.dart'
    as _i1002;
import 'package:sstrip/src/authentication/usecase/login_google_usecase.dart'
    as _i171;
import 'package:sstrip/src/authentication/usecase/login_usecase.dart' as _i815;
import 'package:sstrip/src/authentication/usecase/logout_usecase.dart' as _i519;
import 'package:sstrip/src/authentication/usecase/refresh_token_usecase.dart'
    as _i977;
import 'package:sstrip/src/authentication/usecase/register_usecase.dart'
    as _i552;
import 'package:sstrip/src/authentication/usecase/save_user_usecase.dart'
    as _i316;
import 'package:sstrip/src/authentication/usecase/update_info_user_usecase.dart'
    as _i845;
import 'package:sstrip/src/billing/billing_product_service.dart' as _i548;
import 'package:sstrip/src/billing/billing_store_repository.dart' as _i217;
import 'package:sstrip/src/billing/bloc/billing_store_bloc.dart' as _i318;
import 'package:sstrip/src/billing/create_bill_store_usecase.dart' as _i564;
import 'package:sstrip/src/billing/get_billing_product_details_usecase.dart'
    as _i301;
import 'package:sstrip/src/billing/get_store_item_usecase.dart' as _i815;
import 'package:sstrip/src/billing/update_bill_store_usecase.dart' as _i745;
import 'package:sstrip/src/billing/verify_apple_receipt_usecase.dart' as _i199;
import 'package:sstrip/src/core/hive_service_helper.dart' as _i773;
import 'package:sstrip/src/data/datasources/remote/billing_product_api_service.dart'
    as _i1036;
import 'package:sstrip/src/data/datasources/remote/upload_api_service.dart'
    as _i320;
import 'package:sstrip/src/mapper/mappers.dart' as _i206;
import 'package:sstrip/src/module/register_module.dart' as _i504;
import 'package:sstrip/src/presentation/app/bloc/global_app_bloc.dart' as _i632;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i548.BillingProductService>(
      () => _i548.BillingProductService(),
    );
    gh.lazySingleton<_i773.HiveServiceHelper>(() => _i773.HiveServiceHelper());
    gh.lazySingleton<_i398.FirebaseAnalytics>(
      () => registerModule.firebaseAnalytics,
    );
    gh.lazySingleton<_i346.FirebasePerformance>(
      () => registerModule.firebasePerformance,
    );
    gh.lazySingleton<_i583.GoRouter>(() => registerModule.goRouter);
    gh.lazySingleton<_i206.Mapper>(() => registerModule.mapper);
    gh.lazySingleton<_i651.ApiNetwork>(() => registerModule.apiNetwork);
    gh.lazySingleton<_i651.GraphQLNetwork>(() => registerModule.graphQLNetwork);
    gh.lazySingleton<_i651.SocketNetwork>(() => registerModule.socketNetwork);
    gh.lazySingleton<_i651.GrpcNetwork>(() => registerModule.grpcNetwork);
    gh.lazySingleton<_i651.GrpcManager>(() => registerModule.grpcManager);
    gh.lazySingleton<_i651.AuthInterceptor>(
      () => registerModule.authInterceptor,
    );
    gh.lazySingleton<_i690.InAppPurchase>(() => registerModule.inAppPurchase);
    gh.lazySingleton<_i632.GlobalAppBloc>(() => _i632.GlobalAppBloc());
    gh.factory<_i651.Dio>(
      () => registerModule.collaboratorStaticApiDio,
      instanceName: 'StaticApiDio',
    );
    gh.factory<_i651.Dio>(
      () => registerModule.uploadApiDio,
      instanceName: 'ApiUploadDio',
    );
    gh.factory<_i651.Dio>(
      () => registerModule.collaboratorApiSocialDio,
      instanceName: 'ApiSocialDio',
    );
    gh.factory<_i651.Dio>(
      () => registerModule.collaboratorApiDio,
      instanceName: 'ApiDio',
    );
    gh.factory<String>(
      () => registerModule.uploadApiBaseUrl,
      instanceName: 'ApiUploadBaseUrl',
    );
    gh.factory<String>(
      () => registerModule.collaboratorStaticApiBaseUrl,
      instanceName: 'StaticApiBaseUrl',
    );
    gh.factory<String>(
      () => registerModule.apiAuthProviderBaseUrl,
      instanceName: 'ApiAuthProviderBaseUrl',
    );
    gh.factory<String>(
      () => registerModule.collaboratorApiSocialBaseUrl,
      instanceName: 'ApiSocialBaseUrl',
    );
    gh.factory<_i651.Dio>(
      () => registerModule.apiAuthProviderDio,
      instanceName: 'ApiAuthProviderDio',
    );
    gh.factory<String>(
      () => registerModule.collaboratorApiBaseUrl,
      instanceName: 'ApiBaseUrl',
    );
    gh.lazySingleton<_i320.UploadApiService>(
      () => registerModule.uploadApiService(
        gh<_i651.Dio>(instanceName: 'ApiUploadDio'),
        gh<String>(instanceName: 'ApiUploadBaseUrl'),
      ),
    );
    gh.lazySingleton<_i1036.BillingProductApiService>(
      () => registerModule.billingProductApiService(
        gh<_i651.Dio>(instanceName: 'ApiDio'),
        gh<String>(instanceName: 'ApiBaseUrl'),
      ),
    );
    gh.lazySingleton<_i621.AuthApiService>(
      () => registerModule.collaboratorAuthApiService(
        gh<_i651.Dio>(instanceName: 'ApiAuthProviderDio'),
        gh<String>(instanceName: 'ApiAuthProviderBaseUrl'),
      ),
    );
    gh.lazySingleton<_i217.BillingStoreRepository>(
      () => _i217.BillingStoreRepositoryImpl(
        gh<_i1036.BillingProductApiService>(),
        gh<_i548.BillingProductService>(),
      ),
    );
    gh.lazySingleton<_i263.AuthRepository>(
      () => _i263.AuthRepositoryImpl(gh<_i621.AuthApiService>()),
    );
    gh.factory<_i564.CreateBillStoreUsecase>(
      () => _i564.CreateBillStoreUsecase(
        repository: gh<_i217.BillingStoreRepository>(),
      ),
    );
    gh.factory<_i301.GetBillingProductDetailsUsecase>(
      () => _i301.GetBillingProductDetailsUsecase(
        repository: gh<_i217.BillingStoreRepository>(),
      ),
    );
    gh.factory<_i815.GetStoreItemUsecase>(
      () => _i815.GetStoreItemUsecase(
        repository: gh<_i217.BillingStoreRepository>(),
      ),
    );
    gh.factory<_i745.UpdateBillStoreUsecase>(
      () => _i745.UpdateBillStoreUsecase(
        repository: gh<_i217.BillingStoreRepository>(),
      ),
    );
    gh.factory<_i199.VerifyAppleReceiptUsecase>(
      () => _i199.VerifyAppleReceiptUsecase(
        repository: gh<_i217.BillingStoreRepository>(),
      ),
    );
    gh.factory<_i365.CheckLoginedUsecase>(
      () => _i365.CheckLoginedUsecase(gh<_i263.AuthRepository>()),
    );
    gh.factory<_i72.GetUserUsecase>(
      () => _i72.GetUserUsecase(gh<_i263.AuthRepository>()),
    );
    gh.factory<_i316.SaveUserUsecase>(
      () => _i316.SaveUserUsecase(gh<_i263.AuthRepository>()),
    );
    gh.factory<_i318.BillingStoreBloc>(
      () => _i318.BillingStoreBloc(
        gh<_i815.GetStoreItemUsecase>(),
        gh<_i564.CreateBillStoreUsecase>(),
        gh<_i745.UpdateBillStoreUsecase>(),
        gh<_i301.GetBillingProductDetailsUsecase>(),
        gh<_i199.VerifyAppleReceiptUsecase>(),
      ),
    );
    gh.factory<_i1.AddUserUsecase>(
      () => _i1.AddUserUsecase(gh<_i263.AuthRepository>()),
    );
    gh.factory<_i665.DeleteUserUseCase>(
      () => _i665.DeleteUserUseCase(gh<_i263.AuthRepository>()),
    );
    gh.factory<_i1002.LoginAppleUsecase>(
      () => _i1002.LoginAppleUsecase(gh<_i263.AuthRepository>()),
    );
    gh.factory<_i171.LoginGoogleUsecase>(
      () => _i171.LoginGoogleUsecase(gh<_i263.AuthRepository>()),
    );
    gh.factory<_i815.LoginUsecase>(
      () => _i815.LoginUsecase(gh<_i263.AuthRepository>()),
    );
    gh.factory<_i519.LogoutUsecase>(
      () => _i519.LogoutUsecase(gh<_i263.AuthRepository>()),
    );
    gh.factory<_i977.RefreshTokenUsecase>(
      () => _i977.RefreshTokenUsecase(gh<_i263.AuthRepository>()),
    );
    gh.factory<_i552.RegisterUsecase>(
      () => _i552.RegisterUsecase(gh<_i263.AuthRepository>()),
    );
    gh.factory<_i845.UpdateInfoUserUsecase>(
      () => _i845.UpdateInfoUserUsecase(gh<_i263.AuthRepository>()),
    );
    gh.lazySingleton<_i812.AuthenticationBloc>(
      () => _i812.AuthenticationBloc(
        gh<_i815.LoginUsecase>(),
        gh<_i519.LogoutUsecase>(),
        gh<_i552.RegisterUsecase>(),
        gh<_i365.CheckLoginedUsecase>(),
        gh<_i72.GetUserUsecase>(),
        gh<_i316.SaveUserUsecase>(),
        gh<_i171.LoginGoogleUsecase>(),
        gh<_i1002.LoginAppleUsecase>(),
        gh<_i1.AddUserUsecase>(),
        gh<_i665.DeleteUserUseCase>(),
        gh<_i845.UpdateInfoUserUsecase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i504.RegisterModule {}
