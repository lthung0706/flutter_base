import 'package:json_annotation/json_annotation.dart';

part 'apple_verify_receipt_body.g.dart';

@JsonSerializable(createFactory: false, includeIfNull: false)
class AppleVerifyReceiptBody {
  @JsonKey(name: 'transactionId')
  final String? transactionId;

  @JsonKey(name: 'signedTransactionInfo')
  final String? signedTransactionInfo;

  AppleVerifyReceiptBody({this.transactionId, this.signedTransactionInfo});

  Map<String, dynamic> toJson() => _$AppleVerifyReceiptBodyToJson(this);
}
