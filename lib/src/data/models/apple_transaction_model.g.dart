// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apple_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppleTransactionModel _$AppleTransactionModelFromJson(
  Map<String, dynamic> json,
) => AppleTransactionModel(
  transactionId: json['transactionId'] as String,
  originalTransactionId: json['originalTransactionId'] as String,
  webOrderLineItemId: json['webOrderLineItemId'] as String,
  bundleId: json['bundleId'] as String,
  productId: json['productId'] as String,
  subscriptionGroupIdentifier: json['subscriptionGroupIdentifier'] as String,
  purchaseDate: (json['purchaseDate'] as num).toInt(),
  originalPurchaseDate: (json['originalPurchaseDate'] as num).toInt(),
  expiresDate: (json['expiresDate'] as num).toInt(),
  quantity: (json['quantity'] as num).toInt(),
  type: json['type'] as String,
  inAppOwnershipType: json['inAppOwnershipType'] as String,
  signedDate: (json['signedDate'] as num).toInt(),
  environment: json['environment'] as String,
  storefront: json['storefront'] as String,
  storefrontId: json['storefrontId'] as String,
  transactionReason: json['transactionReason'] as String,
);
