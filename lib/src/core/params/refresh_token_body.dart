import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_body.g.dart';

@JsonSerializable(createFactory: false, includeIfNull: false)
class RefreshTokenRequestBody {
  @JsonKey(name: 'refresh_token')
  final String refreshToken;
  @JsonKey(name: 'device_id')
  final String deviceId;

  RefreshTokenRequestBody(this.refreshToken, this.deviceId);
  Map<String, dynamic> toJson() => _$RefreshTokenRequestBodyToJson(this);
}
