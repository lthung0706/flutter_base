import 'package:json_annotation/json_annotation.dart';

part 'add_user_request_body.g.dart';

@JsonSerializable(createFactory: false, includeIfNull: false)
class AddUserRequestBody {
  AddUserRequestBody({this.id, this.deviceId});
  final String? id;
  @JsonKey(name: 'device_id')
  final String? deviceId;

  Map<String, dynamic> toJson() => _$AddUserRequestBodyToJson(this);
}
