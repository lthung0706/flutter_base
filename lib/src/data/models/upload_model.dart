import 'package:json_annotation/json_annotation.dart';
part 'upload_model.g.dart';

@JsonSerializable(createToJson: false)
class UploadModel {
  UploadModel({this.url});

  @JsonKey(name: 'url')
  final String? url;

  factory UploadModel.fromJson(final Map<String, dynamic> json) =>
      _$UploadModelFromJson(json);
}
