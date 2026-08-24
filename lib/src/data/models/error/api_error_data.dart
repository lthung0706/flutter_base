// Package imports:
import 'package:json_annotation/json_annotation.dart';
import 'package:sstrip/src/data/models/error/error_codes.dart';

// Project imports:

// Project imports:

part 'api_error_data.g.dart';

@JsonSerializable(createToJson: false)
class ApiErrorData {
  const ApiErrorData({this.code = ErrorCodes.failure, this.message = ''});
  factory ApiErrorData.fromJson(final Map<String, dynamic> json) =>
      _$ApiErrorDataFromJson(json);

  final int? code;
  final String? message;
}
