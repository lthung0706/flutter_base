// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$LoginRequestBodyToJson(LoginRequestBody instance) =>
    <String, dynamic>{
      'phone': ?instance.phone,
      'email': ?instance.email,
      'idToken': ?instance.idToken,
      'password': ?instance.password,
      'device_id': ?instance.deviceId,
    };

Map<String, dynamic> _$GoogleLoginRequestBodyToJson(
  GoogleLoginRequestBody instance,
) => <String, dynamic>{'token': instance.token, 'device_id': instance.deviceId};

Map<String, dynamic> _$AppleLoginRequestBodyToJson(
  AppleLoginRequestBody instance,
) => <String, dynamic>{'token': instance.token, 'device_id': instance.deviceId};
