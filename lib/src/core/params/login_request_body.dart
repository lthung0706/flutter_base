// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'login_request_body.g.dart';

@JsonSerializable(createFactory: false, includeIfNull: false)
class LoginRequestBody {
  LoginRequestBody({
    this.idToken,
    this.email,
    this.password,
    this.phone,
    this.deviceId,
  });

  final String? phone;
  final String? email;
  final String? idToken;
  final String? password;
  @JsonKey(name: 'device_id')
  final String? deviceId;
  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);

  LoginRequestBody copyWith({
    final String? phone,
    final String? email,
    final String? idToken,
    final String? password,
    final String? deviceId,
  }) {
    return LoginRequestBody(
      phone: phone ?? this.phone,
      email: email ?? this.email,
      idToken: idToken ?? this.idToken,
      password: password ?? this.password,
      deviceId: deviceId ?? this.deviceId,
    );
  }
}

@JsonSerializable(createFactory: false, includeIfNull: false)
class GoogleLoginRequestBody {
  GoogleLoginRequestBody({required this.token, required this.deviceId});

  final String token;
  @JsonKey(name: 'device_id')
  final String deviceId;
  Map<String, dynamic> toJson() => _$GoogleLoginRequestBodyToJson(this);
}

@JsonSerializable(createFactory: false, includeIfNull: false)
class AppleLoginRequestBody {
  AppleLoginRequestBody({required this.token, required this.deviceId});

  final String token;
  @JsonKey(name: 'device_id')
  final String deviceId;
  Map<String, dynamic> toJson() => _$AppleLoginRequestBodyToJson(this);
}
