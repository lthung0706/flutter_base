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
import 'package:flutter_base/src/authentication/auth_repository.dart' as _i933;
import 'package:flutter_base/src/authentication/bloc/authentication_bloc.dart'
    as _i94;
import 'package:flutter_base/src/authentication/usecase/add_user_usecase.dart'
    as _i606;
import 'package:flutter_base/src/authentication/usecase/check_logined_usecase.dart'
    as _i388;
import 'package:flutter_base/src/authentication/usecase/delete_user_usecase.dart'
    as _i764;
import 'package:flutter_base/src/authentication/usecase/get_user_usecase.dart'
    as _i1010;
import 'package:flutter_base/src/authentication/usecase/login_apple_usecase.dart'
    as _i290;
import 'package:flutter_base/src/authentication/usecase/login_google_usecase.dart'
    as _i888;
import 'package:flutter_base/src/authentication/usecase/login_usecase.dart'
    as _i409;
import 'package:flutter_base/src/authentication/usecase/logout_usecase.dart'
    as _i56;
import 'package:flutter_base/src/authentication/usecase/refresh_token_usecase.dart'
    as _i47;
import 'package:flutter_base/src/authentication/usecase/register_usecase.dart'
    as _i20;
import 'package:flutter_base/src/authentication/usecase/save_user_usecase.dart'
    as _i458;
import 'package:flutter_base/src/authentication/usecase/update_info_user_usecase.dart'
    as _i790;
import 'package:flutter_base/src/billing/billing_product_service.dart' as _i721;
import 'package:flutter_base/src/billing/billing_store_repository.dart'
    as _i704;
import 'package:flutter_base/src/billing/bloc/billing_store_bloc.dart' as _i367;
import 'package:flutter_base/src/billing/create_bill_store_usecase.dart'
    as _i88;
import 'package:flutter_base/src/billing/get_billing_product_details_usecase.dart'
    as _i25;
import 'package:flutter_base/src/billing/get_store_item_usecase.dart' as _i682;
import 'package:flutter_base/src/billing/update_bill_store_usecase.dart'
    as _i97;
import 'package:flutter_base/src/billing/verify_apple_receipt_usecase.dart'
    as _i577;
import 'package:flutter_base/src/core/hive_service_helper.dart' as _i351;
import 'package:flutter_base/src/data/datasources/remote/billing_product_api_service.dart'
    as _i646;
import 'package:flutter_base/src/data/datasources/remote/upload_api_service.dart'
    as _i603;
import 'package:flutter_base/src/mapper/mappers.dart' as _i29;
import 'package:flutter_base/src/module/register_module.dart' as _i1009;
import 'package:flutter_base/src/presentation/app/bloc/global_app_bloc.dart'
    as _i1045;
import 'package:get_it/get_it.dart' as _i174;
import 'package:go_router/go_router.dart' as _i583;
import 'package:in_app_purchase/in_app_purchase.dart' as _i690;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i721.BillingProductService>(
      () => _i721.BillingProductService(),
    );
    gh.lazySingleton<_i351.HiveServiceHelper>(() => _i351.HiveServiceHelper());
    gh.lazySingleton<_i398.FirebaseAnalytics>(
      () => registerModule.firebaseAnalytics,
    );
    gh.lazySingleton<_i346.FirebasePerformance>(
      () => registerModule.firebasePerformance,
    );
    gh.lazySingleton<_i583.GoRouter>(() => registerModule.goRouter);
    gh.lazySingleton<_i29.Mapper>(() => registerModule.mapper);
    gh.lazySingleton<_i651.ApiNetwork>(() => registerModule.apiNetwork);
    gh.lazySingleton<_i651.SupabaseNetwork>(
      () => registerModule.supabaseNetwork,
    );
    gh.lazySingleton<_i651.SupabaseProvider>(
      () => registerModule.supabaseProvider,
    );
    gh.lazySingleton<_i651.SupabaseClient>(() => registerModule.supabaseClient);
    gh.lazySingleton<_i690.InAppPurchase>(() => registerModule.inAppPurchase);
    gh.lazySingleton<_i1045.GlobalAppBloc>(() => _i1045.GlobalAppBloc());
    gh.factory<_i651.Dio>(
      () => registerModule.collaboratorStaticApiDio,
      instanceName: 'StaticApiDio',
    );
    gh.factory<_i651.Dio>(
      () => registerModule.uploadApiDio,
      instanceName: 'ApiUploadDio',
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
      () => registerModule.collaboratorApiBaseUrl,
      instanceName: 'ApiBaseUrl',
    );
    gh.lazySingleton<_i603.UploadApiService>(
      () => registerModule.uploadApiService(
        gh<_i651.Dio>(instanceName: 'ApiUploadDio'),
        gh<String>(instanceName: 'ApiUploadBaseUrl'),
      ),
    );
    gh.lazySingleton<_i646.BillingProductApiService>(
      () => registerModule.billingProductApiService(
        gh<_i651.Dio>(instanceName: 'ApiDio'),
        gh<String>(instanceName: 'ApiBaseUrl'),
      ),
    );
    gh.lazySingleton<_i933.AuthRepository>(
      () => _i933.AuthRepositoryImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i704.BillingStoreRepository>(
      () => _i704.BillingStoreRepositoryImpl(
        gh<_i646.BillingProductApiService>(),
        gh<_i721.BillingProductService>(),
      ),
    );
    gh.factory<_i88.CreateBillStoreUsecase>(
      () => _i88.CreateBillStoreUsecase(
        repository: gh<_i704.BillingStoreRepository>(),
      ),
    );
    gh.factory<_i25.GetBillingProductDetailsUsecase>(
      () => _i25.GetBillingProductDetailsUsecase(
        repository: gh<_i704.BillingStoreRepository>(),
      ),
    );
    gh.factory<_i682.GetStoreItemUsecase>(
      () => _i682.GetStoreItemUsecase(
        repository: gh<_i704.BillingStoreRepository>(),
      ),
    );
    gh.factory<_i97.UpdateBillStoreUsecase>(
      () => _i97.UpdateBillStoreUsecase(
        repository: gh<_i704.BillingStoreRepository>(),
      ),
    );
    gh.factory<_i577.VerifyAppleReceiptUsecase>(
      () => _i577.VerifyAppleReceiptUsecase(
        repository: gh<_i704.BillingStoreRepository>(),
      ),
    );
    gh.factory<_i388.CheckLoginedUsecase>(
      () => _i388.CheckLoginedUsecase(gh<_i933.AuthRepository>()),
    );
    gh.factory<_i1010.GetUserUsecase>(
      () => _i1010.GetUserUsecase(gh<_i933.AuthRepository>()),
    );
    gh.factory<_i458.SaveUserUsecase>(
      () => _i458.SaveUserUsecase(gh<_i933.AuthRepository>()),
    );
    gh.factory<_i606.AddUserUsecase>(
      () => _i606.AddUserUsecase(gh<_i933.AuthRepository>()),
    );
    gh.factory<_i764.DeleteUserUseCase>(
      () => _i764.DeleteUserUseCase(gh<_i933.AuthRepository>()),
    );
    gh.factory<_i290.LoginAppleUsecase>(
      () => _i290.LoginAppleUsecase(gh<_i933.AuthRepository>()),
    );
    gh.factory<_i888.LoginGoogleUsecase>(
      () => _i888.LoginGoogleUsecase(gh<_i933.AuthRepository>()),
    );
    gh.factory<_i409.LoginUsecase>(
      () => _i409.LoginUsecase(gh<_i933.AuthRepository>()),
    );
    gh.factory<_i56.LogoutUsecase>(
      () => _i56.LogoutUsecase(gh<_i933.AuthRepository>()),
    );
    gh.factory<_i47.RefreshTokenUsecase>(
      () => _i47.RefreshTokenUsecase(gh<_i933.AuthRepository>()),
    );
    gh.factory<_i20.RegisterUsecase>(
      () => _i20.RegisterUsecase(gh<_i933.AuthRepository>()),
    );
    gh.factory<_i790.UpdateInfoUserUsecase>(
      () => _i790.UpdateInfoUserUsecase(gh<_i933.AuthRepository>()),
    );
    gh.factory<_i367.BillingStoreBloc>(
      () => _i367.BillingStoreBloc(
        gh<_i682.GetStoreItemUsecase>(),
        gh<_i88.CreateBillStoreUsecase>(),
        gh<_i97.UpdateBillStoreUsecase>(),
        gh<_i25.GetBillingProductDetailsUsecase>(),
        gh<_i577.VerifyAppleReceiptUsecase>(),
      ),
    );
    gh.lazySingleton<_i94.AuthenticationBloc>(
      () => _i94.AuthenticationBloc(
        gh<_i409.LoginUsecase>(),
        gh<_i56.LogoutUsecase>(),
        gh<_i20.RegisterUsecase>(),
        gh<_i388.CheckLoginedUsecase>(),
        gh<_i1010.GetUserUsecase>(),
        gh<_i458.SaveUserUsecase>(),
        gh<_i888.LoginGoogleUsecase>(),
        gh<_i290.LoginAppleUsecase>(),
        gh<_i606.AddUserUsecase>(),
        gh<_i764.DeleteUserUseCase>(),
        gh<_i790.UpdateInfoUserUsecase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i1009.RegisterModule {}
