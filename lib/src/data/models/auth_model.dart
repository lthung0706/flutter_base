import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

@JsonSerializable(createToJson: false)
class AuthDataModel {
  AuthDataModel({
    this.accessToken,
    this.refreshToken,
    this.tokenType,
    this.expiresIn,
    this.expiresAt,
    this.user,
  });

  @JsonKey(name: 'access_token')
  final String? accessToken;

  @JsonKey(name: 'refresh_token')
  final String? refreshToken;

  @JsonKey(name: 'token_type')
  final String? tokenType;

  @JsonKey(name: 'expires_in')
  final int? expiresIn;

  @JsonKey(name: 'expires_at')
  final int? expiresAt;

  @JsonKey(name: 'user')
  final AuthDataUserModel? user;

  factory AuthDataModel.fromJson(final Map<String, dynamic> json) =>
      _$AuthDataModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class AuthDataUserModel {
  AuthDataUserModel({
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

  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'aud')
  final String? aud;

  @JsonKey(name: 'role')
  final String? role;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'email_confirmed_at')
  final String? emailConfirmedAt;

  @JsonKey(name: 'phone')
  final String? phone;

  @JsonKey(name: 'last_sign_in_at')
  final String? lastSignInAt;

  @JsonKey(name: 'app_metadata')
  final AuthDataUserAppMetadataModel? appMetadata;

  @JsonKey(name: 'user_metadata')
  final AuthDataUserUserMetadataModel? userMetadata;

  @JsonKey(name: 'identities')
  final List<AuthDataUserIdentitiesModel?>? identities;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @JsonKey(name: 'confirmed_at')
  final String? confirmedAt;

  factory AuthDataUserModel.fromJson(final Map<String, dynamic> json) =>
      _$AuthDataUserModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class AuthDataUserAppMetadataModel {
  AuthDataUserAppMetadataModel({this.provider, required this.providers});

  @JsonKey(name: 'provider')
  final String? provider;

  @JsonKey(name: 'providers')
  final List<String?> providers;

  factory AuthDataUserAppMetadataModel.fromJson(
    final Map<String, dynamic> json,
  ) => _$AuthDataUserAppMetadataModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class AuthDataUserUserMetadataModel {
  AuthDataUserUserMetadataModel({
    this.email,
    this.emailVerified,
    this.name,
    this.phoneVerified,
    this.sub,
  });

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'email_verified')
  final bool? emailVerified;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'phone_verified')
  final bool? phoneVerified;

  @JsonKey(name: 'sub')
  final String? sub;

  factory AuthDataUserUserMetadataModel.fromJson(
    final Map<String, dynamic> json,
  ) => _$AuthDataUserUserMetadataModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class AuthDataUserIdentitiesModel {
  AuthDataUserIdentitiesModel({
    this.id,
    this.userId,
    this.identityData,
    this.provider,
    this.lastSignInAt,
    this.createdAt,
    this.updatedAt,
  });

  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'user_id')
  final String? userId;

  @JsonKey(name: 'identity_data')
  final AuthDataUserIdentitiesIdentityDataModel? identityData;

  @JsonKey(name: 'provider')
  final String? provider;

  @JsonKey(name: 'last_sign_in_at')
  final String? lastSignInAt;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  factory AuthDataUserIdentitiesModel.fromJson(
    final Map<String, dynamic> json,
  ) => _$AuthDataUserIdentitiesModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class AuthDataUserIdentitiesIdentityDataModel {
  AuthDataUserIdentitiesIdentityDataModel({
    this.email,
    this.emailVerified,
    this.name,
    this.phoneVerified,
    this.sub,
  });

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'email_verified')
  final bool? emailVerified;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'phone_verified')
  final bool? phoneVerified;

  @JsonKey(name: 'sub')
  final String? sub;

  factory AuthDataUserIdentitiesIdentityDataModel.fromJson(
    final Map<String, dynamic> json,
  ) => _$AuthDataUserIdentitiesIdentityDataModelFromJson(json);
}
