// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_respone_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenericResponseModel<T> _$GenericResponseModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => GenericResponseModel<T>(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: _$nullableGenericFromJson(json['data'], fromJsonT),
);

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) => input == null ? null : fromJson(input);
