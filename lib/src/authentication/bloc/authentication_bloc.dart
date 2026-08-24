import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:report_person/src/authentication/auth.dart';
import 'package:report_person/src/authentication/usecase/add_user_usecase.dart';
import 'package:report_person/src/authentication/usecase/check_logined_usecase.dart';
import 'package:report_person/src/authentication/usecase/delete_user_usecase.dart';
import 'package:report_person/src/authentication/usecase/get_user_usecase.dart';
import 'package:report_person/src/authentication/usecase/login_apple_usecase.dart';
import 'package:report_person/src/authentication/usecase/login_google_usecase.dart';
import 'package:report_person/src/authentication/usecase/login_usecase.dart';
import 'package:report_person/src/authentication/usecase/logout_usecase.dart';
import 'package:report_person/src/authentication/usecase/register_usecase.dart';
import 'package:report_person/src/authentication/usecase/save_user_usecase.dart';
import 'package:report_person/src/authentication/usecase/update_info_user_usecase.dart';
import 'package:report_person/src/authentication/view/authentication_page.dart';
import 'package:report_person/src/core/constants/key_local_store.dart';
import 'package:report_person/src/core/params/add_user_request_body.dart';
import 'package:report_person/src/core/params/login_request_body.dart';
import 'package:report_person/src/core/params/register_body_params.dart';
import 'package:report_person/src/core/params/user_request_body.dart';
import 'package:report_person/src/data/models/data/data.dart';
import 'package:report_person/src/data/models/local/user_model.dart';
import 'package:report_person/src/domain/entities/auth_register.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

@lazySingleton
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LoginUsecase _loginUsecase;
  final LoginGoogleUsecase _googleLoginUsecase;
  final LoginAppleUsecase _appleLoginUsecase;
  final LogoutUsecase _logoutUsecase;
  final RegisterUsecase _registerUsecase;
  final CheckLoginedUsecase _checkLoginedUsecase;
  final GetUserUsecase _getUserUsecase;
  final SaveUserUsecase _saveUserUsecase;
  final AddUserUsecase _addUserUsecase;
  final DeleteUserUseCase _deleteUserUsecase;
  final UpdateInfoUserUsecase _updateInfoUserUsecase;

  AuthenticationBloc(
    this._loginUsecase,
    this._logoutUsecase,
    this._registerUsecase,
    this._checkLoginedUsecase,
    this._getUserUsecase,
    this._saveUserUsecase,
    this._googleLoginUsecase,
    this._appleLoginUsecase,
    this._addUserUsecase,
    this._deleteUserUsecase,
    this._updateInfoUserUsecase,
  ) : super(const AuthenticationState(AuthenticationStatus.init)) {
    on<CheckIsLoggedIn>(_onCheckIsLoggedIn);
    on<Login>(_onLogin);
    on<GoogleLogin>(_onGoogleLogin);
    on<AppleLogin>(_onAppleLogin);
    on<Register>(_onRegister);
    on<Logout>(_onLogout);
    on<UpdateInfoUser>(_onUpdateInfoUser);
    on<AddInfoUser>(_onAddInfoUser);
    on<LogoutAndDeleteAccountEvent>(_onLogoutAndDeleteAccount);
  }

  FutureOr<void> _onCheckIsLoggedIn(
    CheckIsLoggedIn event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(state.copyWith(AuthenticationStatus.loading));
    try {
      final isLoggedIn = await _checkLoginedUsecase.call();
      if (!isLoggedIn) {
        emit(state.copyWith(AuthenticationStatus.isExpired));
        return;
      }
      final user = await _getUserUsecase.call();
      final hasToken = (user?.accessToken?.isNotEmpty ?? false);

      if (user != null && hasToken) {
        AuthenticationPage.user = user;
        emit(
          state.copyWith(
            AuthenticationStatus.isLoggedIn,
            data: user,
          ),
        );
      } else {
        emit(state.copyWith(AuthenticationStatus.isExpired));
      }
    } catch (e) {
      debugPrint('Check login error: $e');
      emit(state.copyWith(AuthenticationStatus.isExpired));
    }
  }

  FutureOr<void> _onLogin(
    Login event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(state.copyWith(AuthenticationStatus.loading));
    final dataState = await _loginUsecase.call(params: event.params);
    if (dataState is DataSuccess) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? currencyCode = prefs.getString(KeyLocalStore.currencyCode);
      AuthenticationPage.updateCurrency(currencyCode);

      final user = (dataState.data ?? AuthData()).toUser();
      await _saveUserUsecase.call(params: user);
      AuthenticationPage.user = user;

      emit(
        state.copyWith(
          AuthenticationStatus.loginSuccess,
          data: dataState.data ?? AuthData(),
        ),
      );
    }
    if (dataState is DataFailure) {
      emit(state.copyWith(AuthenticationStatus.failure, data: dataState.error));
    }
  }

  FutureOr<void> _onGoogleLogin(
    GoogleLogin event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(state.copyWith(AuthenticationStatus.loading));
    final dataState = await _googleLoginUsecase.call(params: event.params);
    if (dataState is DataSuccess) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? currencyCode = prefs.getString(KeyLocalStore.currencyCode);
      AuthenticationPage.updateCurrency(currencyCode);

      final user = (dataState.data ?? AuthData()).toUser();
      await _saveUserUsecase.call(params: user);
      AuthenticationPage.user = user;

      emit(
        state.copyWith(
          AuthenticationStatus.loginSocialSuccess,
          data: dataState.data ?? AuthData(),
        ),
      );
    }
    if (dataState is DataFailure) {
      emit(state.copyWith(AuthenticationStatus.failure, data: dataState.error));
    }
  }

  FutureOr<void> _onAppleLogin(
    AppleLogin event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(state.copyWith(AuthenticationStatus.loading));
    final dataState = await _appleLoginUsecase.call(params: event.params);
    if (dataState is DataSuccess) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? currencyCode = prefs.getString(KeyLocalStore.currencyCode);
      AuthenticationPage.updateCurrency(currencyCode);

      final user = (dataState.data ?? AuthData()).toUser();
      await _saveUserUsecase.call(params: user);
      AuthenticationPage.user = user;

      emit(
        state.copyWith(
          AuthenticationStatus.loginSocialSuccess,
          data: dataState.data ?? AuthData(),
        ),
      );
    }
    if (dataState is DataFailure) {
      emit(state.copyWith(AuthenticationStatus.failure, data: dataState.error));
    }
  }

  FutureOr<void> _onRegister(
    Register event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(state.copyWith(AuthenticationStatus.loading));
    final dataState = await _registerUsecase.call(params: event.params);
    if (dataState is DataSuccess) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? currencyCode = prefs.getString(KeyLocalStore.currencyCode);
      AuthenticationPage.updateCurrency(currencyCode);

      final user = (dataState.data ?? AuthenRegister()).toUser();
      await _saveUserUsecase.call(params: user);
      AuthenticationPage.user = user;

      emit(
        state.copyWith(
          AuthenticationStatus.registerSuccess,
          data: dataState.data ?? AuthData(),
        ),
      );
    }
    if (dataState is DataFailure) {
      emit(state.copyWith(AuthenticationStatus.failure, data: dataState.error));
    }
  }

  FutureOr<void> _onLogout(
    Logout event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(state.copyWith(AuthenticationStatus.loading));
    final dataState = await _logoutUsecase.call();
    if (dataState is DataSuccess) {
      await _saveUserUsecase.call(params: AuthData().toUser());
      AuthenticationPage.user = User();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(KeyLocalStore.isLogined, false);
      emit(state.copyWith(AuthenticationStatus.logoutSuccess));
    } else {
      emit(state.copyWith(AuthenticationStatus.failure, data: dataState.error));
    }
  }

  FutureOr<void> _onUpdateInfoUser(
    UpdateInfoUser event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(state.copyWith(AuthenticationStatus.loading));
    final dataState = await _updateInfoUserUsecase.call(params: event.params);
    if (dataState is DataSuccess) {
      emit(
        state.copyWith(
          AuthenticationStatus.updateInfoUserSuccess,
          data: dataState.data,
        ),
      );
    }
    if (dataState is DataFailure) {
      emit(state.copyWith(AuthenticationStatus.failure, data: dataState.error));
    }
  }

  FutureOr<void> _onAddInfoUser(
    AddInfoUser event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(state.copyWith(AuthenticationStatus.loading));
    final dataState = await _addUserUsecase.call(params: event.params);
    if (dataState is DataSuccess) {
      emit(
        state.copyWith(
          AuthenticationStatus.addInfoUserSuccess,
          data: dataState.data,
        ),
      );
    }
    if (dataState is DataFailure) {
      emit(state.copyWith(AuthenticationStatus.failure, data: dataState.error));
    }
  }

  FutureOr<void> _onLogoutAndDeleteAccount(
    LogoutAndDeleteAccountEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(state.copyWith(AuthenticationStatus.loading));
    final dataState = await _deleteUserUsecase.call(params: event.userId);
    if (dataState is DataSuccess) {
      AuthenticationPage.user = User();
      await _saveUserUsecase.call(params: AuthData().toUser());
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(KeyLocalStore.isLogined, false);
      emit(state.copyWith(AuthenticationStatus.logoutAndDeleteAccountSuccess));
    }
    if (dataState is DataFailure) {
      emit(state.copyWith(AuthenticationStatus.failure, data: dataState.error));
    }
  }
}
