import 'package:json_annotation/json_annotation.dart';

part 'user_updated_model.g.dart';

@JsonSerializable(createToJson: false)
class UserUpdatedModel {
  UserUpdatedModel({
    this.createdAt,
    this.deviceId,
    this.id,
    this.isManager,
    this.isShipper,
  });

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'device_id')
  final String? deviceId;

  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'is_manager')
  final bool? isManager;

  @JsonKey(name: 'is_shipper')
  final bool? isShipper;

  factory UserUpdatedModel.fromJson(final Map<String, dynamic> json) =>
      _$UserUpdatedModelFromJson(json);
}
