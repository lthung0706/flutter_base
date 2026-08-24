import '../../data/models/local/user_model.dart';

class AuthenRegister {
  const AuthenRegister({
    this.accessToken,
    this.refreshToken,
    this.tokenType,
    this.expiresIn,
    this.expiresAt,
    this.user,
  });

  final String? accessToken;
  final String? refreshToken;
  final String? tokenType;
  final int? expiresIn;
  final int? expiresAt;
  final AuthenRegisterUser? user;
}

class AuthenRegisterUser {
  const AuthenRegisterUser({
    this.id,
    this.aud,
    this.email,
    this.name,
    this.phone,
    this.emailConfirmedAt,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.userMetadata,
    this.appMetadata,
  });

  final String? id;
  final String? aud;
  final String? email;
  final String? name;
  final String? phone;
  final String? emailConfirmedAt;
  final String? role;
  final String? createdAt;
  final String? updatedAt; // ← thêm
  final AuthenRegisterUserMetadata? userMetadata; // ← thêm
  final AuthenRegisterAppMetadata? appMetadata; // ← thêm
}

class AuthenRegisterUserMetadata {
  const AuthenRegisterUserMetadata({
    this.email,
    this.emailVerified,
    this.name,
    this.phoneVerified,
    this.sub,
  });

  final String? email;
  final bool? emailVerified;
  final String? name;
  final bool? phoneVerified;
  final String? sub;
}

class AuthenRegisterAppMetadata {
  const AuthenRegisterAppMetadata({this.provider, this.providers});

  final String? provider;
  final List<String>? providers;
}

extension AuthenRegisterX on AuthenRegister {
  User toUser() => User(
    accessToken: accessToken,
    refreshToken: refreshToken,
    expiresIn: expiresIn,
    expiresAt: expiresAt,
    email: user?.email,
    id: user?.id,
    phone: user?.phone,
    role: 'Owner',
    ownerId: user?.id,
  );
}
