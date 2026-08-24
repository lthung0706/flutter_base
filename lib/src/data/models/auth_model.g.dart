// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthDataModel _$AuthDataModelFromJson(Map<String, dynamic> json) =>
    AuthDataModel(
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
      tokenType: json['token_type'] as String?,
      expiresIn: (json['expires_in'] as num?)?.toInt(),
      expiresAt: (json['expires_at'] as num?)?.toInt(),
      user: json['user'] == null
          ? null
          : AuthDataUserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

AuthDataUserModel _$AuthDataUserModelFromJson(Map<String, dynamic> json) =>
    AuthDataUserModel(
      id: json['id'] as String?,
      aud: json['aud'] as String?,
      role: json['role'] as String?,
      email: json['email'] as String?,
      emailConfirmedAt: json['email_confirmed_at'] as String?,
      phone: json['phone'] as String?,
      lastSignInAt: json['last_sign_in_at'] as String?,
      appMetadata: json['app_metadata'] == null
          ? null
          : AuthDataUserAppMetadataModel.fromJson(
              json['app_metadata'] as Map<String, dynamic>,
            ),
      userMetadata: json['user_metadata'] == null
          ? null
          : AuthDataUserUserMetadataModel.fromJson(
              json['user_metadata'] as Map<String, dynamic>,
            ),
      identities: (json['identities'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : AuthDataUserIdentitiesModel.fromJson(
                    e as Map<String, dynamic>,
                  ),
          )
          .toList(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      confirmedAt: json['confirmed_at'] as String?,
    );

AuthDataUserAppMetadataModel _$AuthDataUserAppMetadataModelFromJson(
  Map<String, dynamic> json,
) => AuthDataUserAppMetadataModel(
  provider: json['provider'] as String?,
  providers: (json['providers'] as List<dynamic>)
      .map((e) => e as String?)
      .toList(),
);

AuthDataUserUserMetadataModel _$AuthDataUserUserMetadataModelFromJson(
  Map<String, dynamic> json,
) => AuthDataUserUserMetadataModel(
  email: json['email'] as String?,
  emailVerified: json['email_verified'] as bool?,
  name: json['name'] as String?,
  phoneVerified: json['phone_verified'] as bool?,
  sub: json['sub'] as String?,
);

AuthDataUserIdentitiesModel _$AuthDataUserIdentitiesModelFromJson(
  Map<String, dynamic> json,
) => AuthDataUserIdentitiesModel(
  id: json['id'] as String?,
  userId: json['user_id'] as String?,
  identityData: json['identity_data'] == null
      ? null
      : AuthDataUserIdentitiesIdentityDataModel.fromJson(
          json['identity_data'] as Map<String, dynamic>,
        ),
  provider: json['provider'] as String?,
  lastSignInAt: json['last_sign_in_at'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

AuthDataUserIdentitiesIdentityDataModel
_$AuthDataUserIdentitiesIdentityDataModelFromJson(Map<String, dynamic> json) =>
    AuthDataUserIdentitiesIdentityDataModel(
      email: json['email'] as String?,
      emailVerified: json['email_verified'] as bool?,
      name: json['name'] as String?,
      phoneVerified: json['phone_verified'] as bool?,
      sub: json['sub'] as String?,
    );
