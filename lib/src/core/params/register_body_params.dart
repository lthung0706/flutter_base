// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'register_body_params.g.dart';

@JsonSerializable(createFactory: false, includeIfNull: false)
class RegisterBodyParams {
  RegisterBodyParams({this.email, this.phone, this.password, this.name});

  final String? email;
  final String? phone;
  final String? password;
  final String? name;
  Map<String, dynamic> toJson() => _$RegisterBodyParamsToJson(this);

  RegisterBodyParams copyWith({
    final String? email,
    final String? phone,
    final String? password,
    final String? name,
    final String? deviceId,
  }) {
    return RegisterBodyParams(
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      name: name ?? this.name,
    );
  }
}
