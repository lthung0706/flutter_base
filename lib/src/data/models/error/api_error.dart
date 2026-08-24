// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'api_error_data.dart';
import 'error_codes.dart';

class ApiError extends Equatable {
  const ApiError({
    this.code = ErrorCodes.failure,
    this.message = '',
    this.externalCode,
    this.externalMessage,
    this.data,
  });

  final int? code;
  final String? message;
  final int? externalCode;
  final String? externalMessage;
  final ApiErrorData? data;

  @override
  List<Object?> get props => [code, message, data];

  ApiError copyWith({
    final int? code,
    final String? message,
    final int? externalCode,
    final String? externalMessage,
    final ApiErrorData? data,
  }) {
    return ApiError(
      code: code ?? this.code,
      message: message ?? this.message,
      externalCode: externalCode ?? this.externalCode,
      externalMessage: externalMessage ?? this.externalMessage,
      data: data ?? this.data,
    );
  }
}
