part of 'authentication_bloc.dart';

enum AuthenticationStatus {
  init,
  loading,
  success,
  loginSuccess,
  loginSocialSuccess,
  registerSuccess,
  isLoggedIn,
  isExpired,
  logoutSuccess,
  updateInfoUserSuccess,
  addInfoUserSuccess,
  logoutAndDeleteAccountSuccess,
  failure,
}

@immutable
class AuthenticationState extends Equatable {
  const AuthenticationState(this.status, {this.data});
  final dynamic data;
  final AuthenticationStatus status;

  AuthenticationState copyWith<T>(
    final AuthenticationStatus status, {
    final dynamic data,
  }) {
    return AuthenticationState(status, data: data);
  }

  @override
  List<Object?> get props => [status, data];
}
