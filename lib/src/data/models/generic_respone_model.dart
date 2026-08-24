// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'generic_respone_model.g.dart';

@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class GenericResponseModel<T> {
  GenericResponseModel({this.success, this.message, this.data});

  factory GenericResponseModel.fromJson(
    final Map<String, dynamic> json,
    final T Function(Object? json) fromJsonT,
  ) => _$GenericResponseModelFromJson<T>(json, fromJsonT);

  bool? success;
  String? message;
  final T? data;

  @override
  String toString() {
    return '$success, $message';
  }
}
