import 'package:flutter_base/src/data/models/local/user_model.dart';

class AuthData {
  AuthData({
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

  final AuthDataUser? user;
}

class AuthDataUser {
  AuthDataUser({
    this.id,
    this.aud,
    this.role,
    this.email,
    this.emailConfirmedAt,
    this.phone,
    this.lastSignInAt,
    this.appMetadata,
    this.userMetadata,
    this.identities,
    this.createdAt,
    this.updatedAt,
    this.confirmedAt,
  });

  final String? id;

  final String? aud;

  final String? role;

  final String? email;

  final String? emailConfirmedAt;

  final String? phone;

  final String? lastSignInAt;

  final AuthDataUserAppMetadata? appMetadata;

  final AuthDataUserUserMetadata? userMetadata;

  final List<AuthDataUserIdentities?>? identities;

  final String? createdAt;

  final String? updatedAt;

  final String? confirmedAt;
}

class AuthDataUserAppMetadata {
  AuthDataUserAppMetadata({this.provider, required this.providers});

  final String? provider;

  final List<String?> providers;
}

class AuthDataUserUserMetadata {
  AuthDataUserUserMetadata({
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

class AuthDataUserIdentities {
  AuthDataUserIdentities({
    this.id,
    this.userId,
    this.identityData,
    this.provider,
    this.lastSignInAt,
    this.createdAt,
    this.updatedAt,
  });

  final String? id;

  final String? userId;

  final AuthDataUserIdentitiesIdentityData? identityData;

  final String? provider;

  final String? lastSignInAt;

  final String? createdAt;

  final String? updatedAt;
}

class AuthDataUserIdentitiesIdentityData {
  AuthDataUserIdentitiesIdentityData({
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

extension AuthX on AuthData {
  User toUser() => User(
    accessToken: accessToken,
    refreshToken: refreshToken,
    expiresIn: expiresIn,
    expiresAt: expiresAt,
    email: user?.email,
    id: user?.id,
    name: user?.userMetadata?.name,
    phone: user?.phone,
    role: 'Owner',
    ownerId: user?.id,
  );
}
