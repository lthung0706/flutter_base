import 'package:json_annotation/json_annotation.dart';

part 'billing_store_create_body.g.dart';

@JsonSerializable(createFactory: false, includeIfNull: false)
class BillingStoreCreateBody {
  @JsonKey(name: 'created_by')
  final String? createdBy;

  @JsonKey(name: 'purchase_at')
  final String? purchaseAt;

  @JsonKey(name: 'purchase_token')
  final String purchaseToken;

  final String status;

  @JsonKey(name: 'product_id')
  final String productId;

  @JsonKey(name: 'is_restore')
  final bool isRestore;

  final String? source;

  @JsonKey(name: 'product_name')
  final String? productName;

  BillingStoreCreateBody({
    this.createdBy,
    this.purchaseAt,
    required this.purchaseToken,
    required this.status,
    required this.productId,
    required this.isRestore,
    this.source,
    required this.productName,
  });

  Map<String, dynamic> toJson() => _$BillingStoreCreateBodyToJson(this);

  BillingStoreCreateBody copyWith({
    String? createdBy,
    String? purchaseAt,
    String? purchaseToken,
    String? status,
    String? productId,
    bool? isRestore,
    String? source,
    String? productName,
  }) {
    return BillingStoreCreateBody(
      createdBy: createdBy ?? this.createdBy,
      purchaseAt: purchaseAt ?? this.purchaseAt,
      purchaseToken: purchaseToken ?? this.purchaseToken,
      status: status ?? this.status,
      productId: productId ?? this.productId,
      isRestore: isRestore ?? this.isRestore,
      source: source ?? this.source,
      productName: productName ?? this.productName,
    );
  }
}
