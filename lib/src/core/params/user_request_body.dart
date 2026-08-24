import 'package:json_annotation/json_annotation.dart';

part 'user_request_body.g.dart';

@JsonSerializable(createFactory: false, includeIfNull: false)
class UserRequestBody {
  UserRequestBody({this.id, this.deviceId});
  final String? id;
  @JsonKey(name: 'device_id')
  final String? deviceId;

  Map<String, dynamic> toJson() => _$UserRequestBodyToJson(this);
}
