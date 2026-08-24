part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object?> get props => [];
}

class Login extends AuthenticationEvent {
  final LoginRequestBody params;
  const Login(this.params);

  @override
  List<Object?> get props => [params];
}

class GoogleLogin extends AuthenticationEvent {
  final GoogleLoginRequestBody params;
  const GoogleLogin(this.params);

  @override
  List<Object?> get props => [params];
}

class AppleLogin extends AuthenticationEvent {
  final AppleLoginRequestBody params;
  const AppleLogin(this.params);

  @override
  List<Object?> get props => [params];
}

class Logout extends AuthenticationEvent {}

class Register extends AuthenticationEvent {
  final RegisterBodyParams params;
  const Register(this.params);

  @override
  List<Object?> get props => [params];
}

class CheckIsLoggedIn extends AuthenticationEvent {}

class UpdateInfoUser extends AuthenticationEvent {
  final UserRequestBody params;
  const UpdateInfoUser(this.params);

  @override
  List<Object?> get props => [params];
}

class AddInfoUser extends AuthenticationEvent {
  final AddUserRequestBody params;
  const AddInfoUser(this.params);

  @override
  List<Object?> get props => [params];
}

class LogoutAndDeleteAccountEvent extends AuthenticationEvent {
  final String userId;
  const LogoutAndDeleteAccountEvent(this.userId);

  @override
  List<Object?> get props => [userId];
}
