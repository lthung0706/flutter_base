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
import 'package:report_person/src/authentication/auth_api_service.dart'
    as _i747;
import 'package:report_person/src/authentication/auth_repository.dart'
    as _i1062;
import 'package:report_person/src/authentication/bloc/authentication_bloc.dart'
    as _i956;
import 'package:report_person/src/authentication/usecase/add_user_usecase.dart'
    as _i543;
import 'package:report_person/src/authentication/usecase/check_logined_usecase.dart'
    as _i267;
import 'package:report_person/src/authentication/usecase/delete_user_usecase.dart'
    as _i39;
import 'package:report_person/src/authentication/usecase/get_user_usecase.dart'
    as _i302;
import 'package:report_person/src/authentication/usecase/login_apple_usecase.dart'
    as _i670;
import 'package:report_person/src/authentication/usecase/login_google_usecase.dart'
    as _i897;
import 'package:report_person/src/authentication/usecase/login_usecase.dart'
    as _i103;
import 'package:report_person/src/authentication/usecase/logout_usecase.dart'
    as _i1063;
import 'package:report_person/src/authentication/usecase/refresh_token_usecase.dart'
    as _i452;
import 'package:report_person/src/authentication/usecase/register_usecase.dart'
    as _i970;
import 'package:report_person/src/authentication/usecase/save_user_usecase.dart'
    as _i1041;
import 'package:report_person/src/authentication/usecase/update_info_user_usecase.dart'
    as _i647;
import 'package:report_person/src/billing/billing_product_service.dart'
    as _i719;
import 'package:report_person/src/billing/billing_store_repository.dart'
    as _i772;
import 'package:report_person/src/billing/bloc/billing_store_bloc.dart'
    as _i640;
import 'package:report_person/src/billing/create_bill_store_usecase.dart'
    as _i341;
import 'package:report_person/src/billing/get_billing_product_details_usecase.dart'
    as _i931;
import 'package:report_person/src/billing/get_store_item_usecase.dart' as _i876;
import 'package:report_person/src/billing/update_bill_store_usecase.dart'
    as _i369;
import 'package:report_person/src/billing/verify_apple_receipt_usecase.dart'
    as _i666;
import 'package:report_person/src/core/hive_service_helper.dart' as _i401;
import 'package:report_person/src/data/datasources/remote/billing_product_api_service.dart'
    as _i1039;
import 'package:report_person/src/data/datasources/remote/upload_api_service.dart'
    as _i394;
import 'package:report_person/src/mapper/mappers.dart' as _i595;
import 'package:report_person/src/module/register_module.dart' as _i225;
import 'package:report_person/src/presentation/app/bloc/global_app_bloc.dart'
    as _i975;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i719.BillingProductService>(
      () => _i719.BillingProductService(),
    );
    gh.lazySingleton<_i401.HiveServiceHelper>(() => _i401.HiveServiceHelper());
    gh.lazySingleton<_i398.FirebaseAnalytics>(
      () => registerModule.firebaseAnalytics,
    );
    gh.lazySingleton<_i346.FirebasePerformance>(
      () => registerModule.firebasePerformance,
    );
    gh.lazySingleton<_i583.GoRouter>(() => registerModule.goRouter);
    gh.lazySingleton<_i595.Mapper>(() => registerModule.mapper);
    gh.lazySingleton<_i651.ApiNetwork>(() => registerModule.apiNetwork);
    gh.lazySingleton<_i651.GraphQLNetwork>(() => registerModule.graphQLNetwork);
    gh.lazySingleton<_i651.SocketNetwork>(() => registerModule.socketNetwork);
    gh.lazySingleton<_i651.GrpcNetwork>(() => registerModule.grpcNetwork);
    gh.lazySingleton<_i651.GrpcManager>(() => registerModule.grpcManager);
    gh.lazySingleton<_i651.SupabaseNetwork>(
      () => registerModule.supabaseNetwork,
    );
    gh.lazySingleton<_i651.SupabaseProvider>(
      () => registerModule.supabaseProvider,
    );
    gh.lazySingleton<_i651.SupabaseClient>(() => registerModule.supabaseClient);
    gh.lazySingleton<_i651.AuthInterceptor>(
      () => registerModule.authInterceptor,
    );
    gh.lazySingleton<_i690.InAppPurchase>(() => registerModule.inAppPurchase);
    gh.lazySingleton<_i975.GlobalAppBloc>(() => _i975.GlobalAppBloc());
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
    gh.lazySingleton<_i394.UploadApiService>(
      () => registerModule.uploadApiService(
        gh<_i651.Dio>(instanceName: 'ApiUploadDio'),
        gh<String>(instanceName: 'ApiUploadBaseUrl'),
      ),
    );
    gh.lazySingleton<_i1039.BillingProductApiService>(
      () => registerModule.billingProductApiService(
        gh<_i651.Dio>(instanceName: 'ApiDio'),
        gh<String>(instanceName: 'ApiBaseUrl'),
      ),
    );
    gh.lazySingleton<_i747.AuthApiService>(
      () => registerModule.collaboratorAuthApiService(
        gh<_i651.Dio>(instanceName: 'ApiAuthProviderDio'),
        gh<String>(instanceName: 'ApiAuthProviderBaseUrl'),
      ),
    );
    gh.lazySingleton<_i772.BillingStoreRepository>(
      () => _i772.BillingStoreRepositoryImpl(
        gh<_i1039.BillingProductApiService>(),
        gh<_i719.BillingProductService>(),
      ),
    );
    gh.factory<_i341.CreateBillStoreUsecase>(
      () => _i341.CreateBillStoreUsecase(
        repository: gh<_i772.BillingStoreRepository>(),
      ),
    );
    gh.factory<_i931.GetBillingProductDetailsUsecase>(
      () => _i931.GetBillingProductDetailsUsecase(
        repository: gh<_i772.BillingStoreRepository>(),
      ),
    );
    gh.factory<_i876.GetStoreItemUsecase>(
      () => _i876.GetStoreItemUsecase(
        repository: gh<_i772.BillingStoreRepository>(),
      ),
    );
    gh.factory<_i369.UpdateBillStoreUsecase>(
      () => _i369.UpdateBillStoreUsecase(
        repository: gh<_i772.BillingStoreRepository>(),
      ),
    );
    gh.factory<_i666.VerifyAppleReceiptUsecase>(
      () => _i666.VerifyAppleReceiptUsecase(
        repository: gh<_i772.BillingStoreRepository>(),
      ),
    );
    gh.factory<_i640.BillingStoreBloc>(
      () => _i640.BillingStoreBloc(
        gh<_i876.GetStoreItemUsecase>(),
        gh<_i341.CreateBillStoreUsecase>(),
        gh<_i369.UpdateBillStoreUsecase>(),
        gh<_i931.GetBillingProductDetailsUsecase>(),
        gh<_i666.VerifyAppleReceiptUsecase>(),
      ),
    );
    gh.lazySingleton<_i1062.AuthRepository>(
      () => _i1062.AuthRepositoryImpl(gh<_i747.AuthApiService>()),
    );
    gh.factory<_i267.CheckLoginedUsecase>(
      () => _i267.CheckLoginedUsecase(gh<_i1062.AuthRepository>()),
    );
    gh.factory<_i302.GetUserUsecase>(
      () => _i302.GetUserUsecase(gh<_i1062.AuthRepository>()),
    );
    gh.factory<_i1041.SaveUserUsecase>(
      () => _i1041.SaveUserUsecase(gh<_i1062.AuthRepository>()),
    );
    gh.factory<_i543.AddUserUsecase>(
      () => _i543.AddUserUsecase(gh<_i1062.AuthRepository>()),
    );
    gh.factory<_i39.DeleteUserUseCase>(
      () => _i39.DeleteUserUseCase(gh<_i1062.AuthRepository>()),
    );
    gh.factory<_i670.LoginAppleUsecase>(
      () => _i670.LoginAppleUsecase(gh<_i1062.AuthRepository>()),
    );
    gh.factory<_i897.LoginGoogleUsecase>(
      () => _i897.LoginGoogleUsecase(gh<_i1062.AuthRepository>()),
    );
    gh.factory<_i103.LoginUsecase>(
      () => _i103.LoginUsecase(gh<_i1062.AuthRepository>()),
    );
    gh.factory<_i1063.LogoutUsecase>(
      () => _i1063.LogoutUsecase(gh<_i1062.AuthRepository>()),
    );
    gh.factory<_i452.RefreshTokenUsecase>(
      () => _i452.RefreshTokenUsecase(gh<_i1062.AuthRepository>()),
    );
    gh.factory<_i970.RegisterUsecase>(
      () => _i970.RegisterUsecase(gh<_i1062.AuthRepository>()),
    );
    gh.factory<_i647.UpdateInfoUserUsecase>(
      () => _i647.UpdateInfoUserUsecase(gh<_i1062.AuthRepository>()),
    );
    gh.lazySingleton<_i956.AuthenticationBloc>(
      () => _i956.AuthenticationBloc(
        gh<_i103.LoginUsecase>(),
        gh<_i1063.LogoutUsecase>(),
        gh<_i970.RegisterUsecase>(),
        gh<_i267.CheckLoginedUsecase>(),
        gh<_i302.GetUserUsecase>(),
        gh<_i1041.SaveUserUsecase>(),
        gh<_i897.LoginGoogleUsecase>(),
        gh<_i670.LoginAppleUsecase>(),
        gh<_i543.AddUserUsecase>(),
        gh<_i39.DeleteUserUseCase>(),
        gh<_i647.UpdateInfoUserUsecase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i225.RegisterModule {}
