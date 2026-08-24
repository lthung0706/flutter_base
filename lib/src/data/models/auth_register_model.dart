import 'package:json_annotation/json_annotation.dart';

part 'auth_register_model.g.dart';

@JsonSerializable(createToJson: false)
class AuthenRegisterModel {
  const AuthenRegisterModel({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.expiresAt,
    this.refreshToken,
    this.user,
  });

  @JsonKey(name: 'access_token')
  final String? accessToken;

  @JsonKey(name: 'token_type')
  final String? tokenType;

  @JsonKey(name: 'expires_in')
  final int? expiresIn;

  @JsonKey(name: 'expires_at')
  final int? expiresAt;

  @JsonKey(name: 'refresh_token')
  final String? refreshToken;

  final AuthenRegisterUserModel? user;

  factory AuthenRegisterModel.fromJson(Map<String, dynamic> json) =>
      _$AuthenRegisterModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class AuthenRegisterUserModel {
  const AuthenRegisterUserModel({
    this.id,
    this.aud,
    this.role,
    this.email,
    this.name,
    this.emailConfirmedAt,
    this.phone,
    this.createdAt,
    this.updatedAt,
    this.userMetadata,
    this.appMetadata,
  });

  final String? id;
  final String? aud;
  final String? role;
  final String? email;
  final String? name;

  @JsonKey(name: 'email_confirmed_at')
  final String? emailConfirmedAt;

  final String? phone;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @JsonKey(name: 'user_metadata')
  final AuthenRegisterUserMetadataModel? userMetadata;

  @JsonKey(name: 'app_metadata')
  final AuthenRegisterAppMetadataModel? appMetadata;

  factory AuthenRegisterUserModel.fromJson(Map<String, dynamic> json) =>
      _$AuthenRegisterUserModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class AuthenRegisterUserMetadataModel {
  const AuthenRegisterUserMetadataModel({
    this.email,
    this.emailVerified,
    this.name,
    this.phoneVerified,
    this.sub,
  });

  final String? email;

  @JsonKey(name: 'email_verified')
  final bool? emailVerified;

  final String? name;

  @JsonKey(name: 'phone_verified')
  final bool? phoneVerified;

  final String? sub;

  factory AuthenRegisterUserMetadataModel.fromJson(Map<String, dynamic> json) =>
      _$AuthenRegisterUserMetadataModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class AuthenRegisterAppMetadataModel {
  const AuthenRegisterAppMetadataModel({this.provider, this.providers});

  final String? provider;
  final List<String>? providers;

  factory AuthenRegisterAppMetadataModel.fromJson(Map<String, dynamic> json) =>
      _$AuthenRegisterAppMetadataModelFromJson(json);
}
