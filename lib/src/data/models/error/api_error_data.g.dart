// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorData _$ApiErrorDataFromJson(Map<String, dynamic> json) => ApiErrorData(
  code: (json['code'] as num?)?.toInt() ?? ErrorCodes.failure,
  message: json['message'] as String? ?? '',
);
