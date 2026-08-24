import 'package:json_annotation/json_annotation.dart';

part 'billing_store_update_status_body.g.dart';

@JsonSerializable(createFactory: false, includeIfNull: false)
class BillingStoreUpdateStatusBody {
  @JsonKey(name: 'purchase_id')
  final String? purchaseId;
  final String status;
  @JsonKey(name: 'is_restore')
  final bool isRestore;
  @JsonKey(name: 'purchase_token')
  final String? purchaseToken;

  BillingStoreUpdateStatusBody({
    this.purchaseId,
    required this.purchaseToken,
    required this.status,
    required this.isRestore,
  });

  Map<String, dynamic> toJson() => _$BillingStoreUpdateStatusBodyToJson(this);
}
