// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billing_store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillingStoreModel _$BillingStoreModelFromJson(Map<String, dynamic> json) =>
    BillingStoreModel(
      id: json['id'] as String?,
      createdBy: json['created_by'] as String?,
      purchaseAt: json['purchase_at'] as String?,
      purchaseToken: json['purchase_token'] as String?,
      status: json['status'] as String?,
      purchaseId: json['purchase_id'] as String?,
      createdAt: json['created_at'] as String?,
      isRestore: json['is_restore'] as bool?,
      productId: json['product_id'] as String?,
      source: json['source'] as String?,
      status2: json['status_2'] as String?,
    );

StoreItemModel _$StoreItemModelFromJson(Map<String, dynamic> json) =>
    StoreItemModel(id: json['id'] as String?);
