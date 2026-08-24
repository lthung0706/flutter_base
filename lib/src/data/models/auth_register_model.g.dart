// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenRegisterModel _$AuthenRegisterModelFromJson(Map<String, dynamic> json) =>
    AuthenRegisterModel(
      accessToken: json['access_token'] as String?,
      tokenType: json['token_type'] as String?,
      expiresIn: (json['expires_in'] as num?)?.toInt(),
      expiresAt: (json['expires_at'] as num?)?.toInt(),
      refreshToken: json['refresh_token'] as String?,
      user: json['user'] == null
          ? null
          : AuthenRegisterUserModel.fromJson(
              json['user'] as Map<String, dynamic>,
            ),
    );

AuthenRegisterUserModel _$AuthenRegisterUserModelFromJson(
  Map<String, dynamic> json,
) => AuthenRegisterUserModel(
  id: json['id'] as String?,
  aud: json['aud'] as String?,
  role: json['role'] as String?,
  email: json['email'] as String?,
  name: json['name'] as String?,
  emailConfirmedAt: json['email_confirmed_at'] as String?,
  phone: json['phone'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  userMetadata: json['user_metadata'] == null
      ? null
      : AuthenRegisterUserMetadataModel.fromJson(
          json['user_metadata'] as Map<String, dynamic>,
        ),
  appMetadata: json['app_metadata'] == null
      ? null
      : AuthenRegisterAppMetadataModel.fromJson(
          json['app_metadata'] as Map<String, dynamic>,
        ),
);

AuthenRegisterUserMetadataModel _$AuthenRegisterUserMetadataModelFromJson(
  Map<String, dynamic> json,
) => AuthenRegisterUserMetadataModel(
  email: json['email'] as String?,
  emailVerified: json['email_verified'] as bool?,
  name: json['name'] as String?,
  phoneVerified: json['phone_verified'] as bool?,
  sub: json['sub'] as String?,
);

AuthenRegisterAppMetadataModel _$AuthenRegisterAppMetadataModelFromJson(
  Map<String, dynamic> json,
) => AuthenRegisterAppMetadataModel(
  provider: json['provider'] as String?,
  providers: (json['providers'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);
