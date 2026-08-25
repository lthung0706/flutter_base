import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_base/src/authentication/auth.dart';
import 'package:flutter_base/src/core/constants/key_local_store.dart';
import 'package:flutter_base/src/core/hive_service_helper.dart';
import 'package:flutter_base/src/core/params/add_user_request_body.dart';
import 'package:flutter_base/src/core/params/login_request_body.dart';
import 'package:flutter_base/src/core/params/refresh_token_body.dart';
import 'package:flutter_base/src/core/params/register_body_params.dart';
import 'package:flutter_base/src/core/params/user_request_body.dart';
import 'package:flutter_base/src/data/models/data/data.dart';
import 'package:flutter_base/src/data/models/error/api_error.dart';
import 'package:flutter_base/src/data/models/local/user_model.dart';
import 'package:flutter_base/src/domain/entities/auth_register.dart';
import 'package:flutter_base/src/domain/entities/user_updated.dart';
import 'package:flutter_base/src/module/injector.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

abstract class AuthRepository {
  Future<DataState<AuthData>> login(final LoginRequestBody body);
  Future<DataState<AuthData>> googleLogin(final GoogleLoginRequestBody body);
  Future<DataState<AuthData>> appleLogin(final AppleLoginRequestBody body);
  Future<DataState<List<UserUpdated>>> updateInfoUser(
    final UserRequestBody body,
  );
  Future<DataState<bool>> logout();
  Future<DataState<AuthenRegister>> register(final RegisterBodyParams body);
  Future<bool> isLoggedIn();
  Future<void> getOtp();
  Future<User?> getUser();
  Future<void> saveUser(final User? user);
  Future<void> resetPassword();
  Future<DataState<AuthData>> refreshToken(final RefreshTokenRequestBody body);
  Future<DataState<bool>> addUser(final AddUserRequestBody body);
  Future<DataState<bool>> deleteUser(final String userId);
}

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final sb.SupabaseClient _supabaseClient;
  const AuthRepositoryImpl(this._supabaseClient);

  AuthData _mapSessionToAuthData(final sb.Session session) {
    final user = session.user;
    return AuthData(
      accessToken: session.accessToken,
      refreshToken: session.refreshToken,
      tokenType: session.tokenType,
      expiresIn: session.expiresIn,
      expiresAt: session.expiresAt,
      user: AuthDataUser(
        id: user.id,
        email: user.email,
        phone: user.phone,
        createdAt: user.createdAt,
        updatedAt: user.updatedAt,
        userMetadata: AuthDataUserUserMetadata(
          name: user.userMetadata?['name'] as String? ??
              user.userMetadata?['full_name'] as String?,
          email: user.email,
          emailVerified: user.userMetadata?['email_verified'] as bool?,
          phoneVerified: user.userMetadata?['phone_verified'] as bool?,
          sub: user.id,
        ),
      ),
    );
  }

  @override
  Future<DataState<bool>> addUser(final AddUserRequestBody body) async {
    try {
      return const DataSuccess(true);
    } catch (e) {
      return DataFailure(ApiError(message: e.toString()));
    }
  }

  @override
  Future<DataState<AuthData>> login(final LoginRequestBody body) async {
    try {
      final response = await _supabaseClient.auth.signInWithPassword(
        email: body.email ?? '',
        password: body.password ?? '',
      );
      final session = response.session;
      if (session != null) {
        return DataSuccess(_mapSessionToAuthData(session));
      }
      return const DataFailure(ApiError(message: 'Login failed'));
    } on sb.AuthException catch (error) {
      return DataFailure(
        ApiError(
          message: error.message,
          code: int.tryParse(error.statusCode ?? ''),
        ),
      );
    } catch (e) {
      debugPrint('login error: $e');
      return DataFailure(ApiError(message: e.toString()));
    }
  }

  @override
  Future<DataState<AuthData>> googleLogin(
    final GoogleLoginRequestBody body,
  ) async {
    try {
      final response = await _supabaseClient.auth.signInWithIdToken(
        provider: sb.OAuthProvider.google,
        idToken: body.token,
      );
      final session = response.session;
      if (session != null) {
        return DataSuccess(_mapSessionToAuthData(session));
      }
      debugPrint('google login failed: ${response.user}');
      return const DataFailure(ApiError(message: 'Google login failed'));
    } on sb.AuthException catch (error) {
      debugPrint('google login failed: ${error.message}');
      return DataFailure(
        ApiError(
          message: error.message,
          code: int.tryParse(error.statusCode ?? ''),
        ),
      );
    } catch (e) {
      return DataFailure(ApiError(message: e.toString()));
    }
  }

  @override
  Future<DataState<AuthData>> appleLogin(
    final AppleLoginRequestBody body,
  ) async {
    try {
      final response = await _supabaseClient.auth.signInWithIdToken(
        provider: sb.OAuthProvider.apple,
        idToken: body.token,
      );
      final session = response.session;
      if (session != null) {
        return DataSuccess(_mapSessionToAuthData(session));
      }
      return const DataFailure(ApiError(message: 'Apple login failed'));
    } on sb.AuthException catch (error) {
      return DataFailure(
        ApiError(
          message: error.message,
          code: int.tryParse(error.statusCode ?? ''),
        ),
      );
    } catch (e) {
      return DataFailure(ApiError(message: e.toString()));
    }
  }

  @override
  Future<DataState<bool>> logout() async {
    try {
      await _supabaseClient.auth.signOut();
      return const DataSuccess(true);
    } on sb.AuthException catch (error) {
      return DataFailure(ApiError(message: error.message));
    } catch (e) {
      return DataFailure(ApiError(message: e.toString()));
    }
  }

  @override
  Future<DataState<AuthenRegister>> register(
    final RegisterBodyParams body,
  ) async {
    try {
      final response = await _supabaseClient.auth.signUp(
        email: body.email ?? '',
        password: body.password ?? '',
        data: {
          if (body.name != null) 'name': body.name,
        },
      );
      final session = response.session;
      final user = response.user;
      final authRegister = AuthenRegister(
        accessToken: session?.accessToken,
        refreshToken: session?.refreshToken,
        tokenType: session?.tokenType,
        expiresIn: session?.expiresIn,
        expiresAt: session?.expiresAt,
        user: user != null
            ? AuthenRegisterUser(
                id: user.id,
                email: user.email,
                name: body.name ?? user.userMetadata?['name'] as String?,
                phone: user.phone,
                createdAt: user.createdAt,
                updatedAt: user.updatedAt,
              )
            : null,
      );
      return DataSuccess(authRegister);
    } on sb.AuthException catch (error) {
      return DataFailure(
        ApiError(
          message: error.message,
          code: int.tryParse(error.statusCode ?? ''),
        ),
      );
    } catch (e) {
      return DataFailure(ApiError(message: e.toString()));
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    final session = _supabaseClient.auth.currentSession;
    if (session != null && !session.isExpired) {
      return true;
    }
    final user = await getUser();
    return user?.accessToken?.isNotEmpty ?? false;
  }

  @override
  Future<void> getOtp() async {}

  @override
  Future<User?> getUser() async {
    return getIt<HiveServiceHelper>().getBox<User>(BoxName.user);
  }

  @override
  Future<void> saveUser(final User? user) async {
    if (user == null) {
      await getIt<HiveServiceHelper>().deleteBox(BoxName.user);
      return;
    }
    await getIt<HiveServiceHelper>().saveBox<User>(BoxName.user, user);
  }

  @override
  Future<void> resetPassword() async {}

  @override
  Future<DataState<AuthData>> refreshToken(
    final RefreshTokenRequestBody body,
  ) async {
    try {
      final response = await _supabaseClient.auth.refreshSession(body.refreshToken);
      final session = response.session;
      if (session != null) {
        return DataSuccess(_mapSessionToAuthData(session));
      }
      return const DataFailure(ApiError(message: 'Refresh token failed'));
    } on sb.AuthException catch (error) {
      return DataFailure(
        ApiError(
          message: error.message,
          code: int.tryParse(error.statusCode ?? ''),
        ),
      );
    } catch (e) {
      return DataFailure(ApiError(message: e.toString()));
    }
  }

  @override
  Future<DataState<List<UserUpdated>>> updateInfoUser(
    final UserRequestBody body,
  ) async {
    try {
      final user = _supabaseClient.auth.currentUser;
      if (user != null) {
        return DataSuccess([
          UserUpdated(
            id: user.id,
            deviceId: body.deviceId,
            createdAt: user.createdAt,
          ),
        ]);
      }
      return const DataFailure(ApiError(message: 'Update user info failed'));
    } on sb.AuthException catch (error) {
      return DataFailure(ApiError(message: error.message));
    } catch (e) {
      return DataFailure(ApiError(message: e.toString()));
    }
  }

  @override
  Future<DataState<bool>> deleteUser(final String userId) async {
    try {
      return const DataSuccess(true);
    } catch (e) {
      return DataFailure(ApiError(message: e.toString()));
    }
  }
}
