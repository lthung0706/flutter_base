import 'package:json_annotation/json_annotation.dart';

part 'billing_store_model.g.dart';

@JsonSerializable(createToJson: false)
class BillingStoreModel {
  final String? id;

  @JsonKey(name: 'created_by')
  final String? createdBy;

  @JsonKey(name: 'purchase_at')
  final String? purchaseAt;

  @JsonKey(name: 'purchase_token')
  final String? purchaseToken;

  final String? status;

  @JsonKey(name: 'status_2')
  final String? status2;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'purchase_id')
  final String? purchaseId;

  @JsonKey(name: 'is_restore')
  final bool? isRestore;

  @JsonKey(name: 'product_id')
  final String? productId;

  @JsonKey(name: 'source')
  final String? source;

  BillingStoreModel({
    this.id,
    this.createdBy,
    this.purchaseAt,
    this.purchaseToken,
    this.status,
    this.purchaseId,
    this.createdAt,
    this.isRestore,
    this.productId,
    this.source,
    this.status2,
  });

  factory BillingStoreModel.fromJson(Map<String, dynamic> json) =>
      _$BillingStoreModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class StoreItemModel {
  final String? id;

  StoreItemModel({this.id});

  factory StoreItemModel.fromJson(Map<String, dynamic> json) =>
      _$StoreItemModelFromJson(json);
}
