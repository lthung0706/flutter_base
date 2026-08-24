import 'dart:io';

import 'package:app_config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:report_person/src/authentication/auth.dart';
import 'package:report_person/src/authentication/auth_api_service.dart';
import 'package:report_person/src/core/constants/key_local_store.dart';
import 'package:report_person/src/core/hive_service_helper.dart';
import 'package:report_person/src/core/params/login_request_body.dart';
import 'package:report_person/src/core/params/register_body_params.dart';
import 'package:report_person/src/data/models/auth_model.dart';
import 'package:report_person/src/data/models/data/data.dart';
import 'package:report_person/src/data/models/error/api_error.dart';
import 'package:report_person/src/data/models/error/error_codes.dart';
import 'package:report_person/src/data/models/extensions/dio_response.dart';
import 'package:report_person/src/data/models/local/user_model.dart';
import 'package:report_person/src/domain/entities/auth_register.dart';
import 'package:report_person/src/module/injector.dart';

import '../core/params/refresh_token_body.dart';
import '../core/params/user_request_body.dart';
import '../core/params/add_user_request_body.dart';
import '../data/models/auth_register_model.dart';
import '../data/models/user_updated_model.dart';
import '../domain/entities/user_updated.dart';
import '../mapper/mappers.dart';

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
  final AuthApiService authApiService;
  const AuthRepositoryImpl(this.authApiService);

  @override
  Future<DataState<bool>> addUser(final AddUserRequestBody body) async {
    try {
      final httpResponse = await authApiService.addUser(body, isMockUp: false);
      if (httpResponse.data?.success ?? false) {
        return const DataSuccess(true);
      } else {
        return DataFailure(
          ApiError(message: httpResponse.response.statusMessage),
        );
      }
    } on DioException catch (error) {
      return DataFailure(error.response?.apiError);
    } catch (_) {
      return const DataFailure(null);
    }
  }

  @override
  Future<DataState<AuthData>> login(final LoginRequestBody body) async {
    try {
      final httpResponse = await authApiService.login(body, isMockUp: false);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final data = getIt<Mapper>().convert<AuthDataModel, AuthData>(
          httpResponse.data?.data,
        );
        return DataSuccess(data);
      } else {
        return DataFailure(
          ApiError(message: httpResponse.response.statusMessage),
        );
      }
    } on DioException catch (error) {
      if (error.response?.statusCode == HttpStatus.unauthorized) {
        return DataFailure(const ApiError(code: ErrorCodes.invalidCredential));
      }
      return DataFailure(error.response?.apiError);
    } catch (e) {
      debugPrint('login error: $e');
      return const DataFailure(null);
    }
  }

  @override
  Future<DataState<AuthData>> googleLogin(
    final GoogleLoginRequestBody body,
  ) async {
    try {
      final httpResponse = await authApiService.googleLogin(
        body,
        isMockUp: false,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final data = getIt<Mapper>().convert<AuthDataModel, AuthData>(
          httpResponse.data?.data,
        );
        return DataSuccess(data);
      } else {
        return DataFailure(
          ApiError(message: httpResponse.response.statusMessage),
        );
      }
    } on DioException catch (error) {
      return DataFailure(error.response?.apiError);
    } catch (_) {
      return const DataFailure(null);
    }
  }

  @override
  Future<DataState<AuthData>> appleLogin(
    final AppleLoginRequestBody body,
  ) async {
    try {
      final httpResponse = await authApiService.appleLogin(
        body,
        isMockUp: false,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final data = getIt<Mapper>().convert<AuthDataModel, AuthData>(
          httpResponse.data?.data,
        );
        return DataSuccess(data);
      } else {
        return DataFailure(
          ApiError(message: httpResponse.response.statusMessage),
        );
      }
    } on DioException catch (error) {
      return DataFailure(error.response?.apiError);
    } catch (_) {
      return const DataFailure(null);
    }
  }

  @override
  Future<DataState<bool>> logout() async {
    try {
      await authApiService.logout(isMockUp: false);
      return const DataSuccess(true);
    } on DioException catch (error) {
      return DataFailure(error.response?.apiError);
    } catch (_) {
      return const DataFailure(null);
    }
  }

  @override
  Future<DataState<AuthenRegister>> register(
    final RegisterBodyParams body,
  ) async {
    try {
      final httpResponse = await authApiService.register(body, isMockUp: false);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final data = getIt<Mapper>()
            .convert<AuthenRegisterModel, AuthenRegister>(
              httpResponse.data?.data,
            );
        return DataSuccess(data);
      } else {
        return DataFailure(
          ApiError(message: httpResponse.response.statusMessage),
        );
      }
    } on DioException catch (error) {
      return DataFailure(error.response?.apiError);
    } catch (_) {
      return const DataFailure(null);
    }
  }

  @override
  Future<bool> isLoggedIn() async {
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
      final httpResponse = await authApiService.refreshToken(
        body,
        isMockUp: false,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final data = getIt<Mapper>().convert<AuthDataModel, AuthData>(
          httpResponse.data?.data,
        );
        return DataSuccess(data);
      } else {
        return DataFailure(
          ApiError(message: httpResponse.response.statusMessage),
        );
      }
    } on DioException catch (error) {
      return DataFailure(error.response?.apiError);
    } catch (_) {
      return const DataFailure(null);
    }
  }

  @override
  Future<DataState<List<UserUpdated>>> updateInfoUser(
    final UserRequestBody body,
  ) async {
    try {
      final httpResponse = await authApiService.updateInfoUser(
        body,
        isMockUp: false,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final data = getIt<Mapper>().convertList<UserUpdatedModel, UserUpdated>(
          httpResponse.data?.data ?? [],
        );
        return DataSuccess(data);
      } else {
        return DataFailure(
          ApiError(message: httpResponse.response.statusMessage),
        );
      }
    } on DioException catch (error) {
      return DataFailure(error.response?.apiError);
    } catch (_) {
      return const DataFailure(null);
    }
  }

  @override
  Future<DataState<bool>> deleteUser(final String userId) async {
    try {
      final httpResponse = await authApiService.deleteUser(
        userId: userId,
        isMockUp: false,
      );
      if (httpResponse.data?.success ?? false) {
        return const DataSuccess(true);
      } else {
        return DataFailure(
          ApiError(message: httpResponse.response.statusMessage),
        );
      }
    } on DioException catch (error) {
      return DataFailure(error.response?.apiError);
    } catch (_) {
      return const DataFailure(null);
    }
  }
}
