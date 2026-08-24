import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sstrip/src/authentication/view/authentication_page.dart';
import 'package:sstrip/src/core/constants/key_local_store.dart';

part 'global_app_event.dart';
part 'global_app_state.dart';

/// Khởi tạo các init cơ bản cho ứng dụng
/// preCache image, load config, ...
///
/// Note: Language và Theme đã chuyển sang AppSettingsProvider (InheritedWidget).
/// GlobalAppBloc chỉ quản lý: onboarding status + currency.

@lazySingleton
class GlobalAppBloc extends Bloc<GlobalAppEvent, GlobalAppState> {
  GlobalAppBloc() : super(const GlobalAppState(GlobalAppStatus.init)) {
    on<GlobalAppStarted>(_onGlobalAppStarted);
    on<GlobalAppContinueOnBoarding>(_onGlobalAppContinueOnBoarding);
    on<GlobalAppCurrencyChanged>(_onGlobalAppCurrencyChanged);
  }

  FutureOr<void> _onGlobalAppCurrencyChanged(
    GlobalAppCurrencyChanged event,
    Emitter<GlobalAppState> emit,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(KeyLocalStore.currencyCode, event.currencyCode);
    AuthenticationPage.updateCurrency(event.currencyCode);
    emit(state.copyWith(state.status, currencyCode: event.currencyCode));
  }

  FutureOr<void> _onGlobalAppContinueOnBoarding(
    GlobalAppContinueOnBoarding event,
    Emitter<GlobalAppState> emit,
  ) async {
    emit(state.copyWith(GlobalAppStatus.loading));
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(KeyLocalStore.isFirstLaunch, true);
    emit(state.copyWith(GlobalAppStatus.isNotFirstLaunch));
  }

  FutureOr<void> _onGlobalAppStarted(
    GlobalAppStarted event,
    Emitter<GlobalAppState> emit,
  ) async {
    emit(state.copyWith(GlobalAppStatus.loading));
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? currencyCode = prefs.getString(KeyLocalStore.currencyCode);
    AuthenticationPage.updateCurrency(currencyCode);

    final bool isFirstLaunch =
        prefs.getBool(KeyLocalStore.isFirstLaunch) ?? false;

    if (!isFirstLaunch) {
      emit(
        state.copyWith(
          GlobalAppStatus.isFirstLaunch,
          currencyCode: currencyCode,
        ),
      );
    } else {
      emit(
        state.copyWith(
          GlobalAppStatus.isNotFirstLaunch,
          currencyCode: currencyCode,
        ),
      );
    }
  }
}
