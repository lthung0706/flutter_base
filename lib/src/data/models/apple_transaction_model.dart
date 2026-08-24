import 'package:json_annotation/json_annotation.dart';

part 'apple_transaction_model.g.dart';

@JsonSerializable(createToJson: false)
class AppleTransactionModel {
  @JsonKey(name: 'transactionId')
  final String transactionId;

  @JsonKey(name: 'originalTransactionId')
  final String originalTransactionId;

  @JsonKey(name: 'webOrderLineItemId')
  final String webOrderLineItemId;

  @JsonKey(name: 'bundleId')
  final String bundleId;

  @JsonKey(name: 'productId')
  final String productId;

  @JsonKey(name: 'subscriptionGroupIdentifier')
  final String subscriptionGroupIdentifier;

  @JsonKey(name: 'purchaseDate')
  final int purchaseDate;

  @JsonKey(name: 'originalPurchaseDate')
  final int originalPurchaseDate;

  @JsonKey(name: 'expiresDate')
  final int expiresDate;

  @JsonKey(name: 'quantity')
  final int quantity;

  @JsonKey(name: 'type')
  final String type;

  @JsonKey(name: 'inAppOwnershipType')
  final String inAppOwnershipType;

  @JsonKey(name: 'signedDate')
  final int signedDate;

  @JsonKey(name: 'environment')
  final String environment;

  @JsonKey(name: 'storefront')
  final String storefront;

  @JsonKey(name: 'storefrontId')
  final String storefrontId;

  @JsonKey(name: 'transactionReason')
  final String transactionReason;

  const AppleTransactionModel({
    required this.transactionId,
    required this.originalTransactionId,
    required this.webOrderLineItemId,
    required this.bundleId,
    required this.productId,
    required this.subscriptionGroupIdentifier,
    required this.purchaseDate,
    required this.originalPurchaseDate,
    required this.expiresDate,
    required this.quantity,
    required this.type,
    required this.inAppOwnershipType,
    required this.signedDate,
    required this.environment,
    required this.storefront,
    required this.storefrontId,
    required this.transactionReason,
  });

  factory AppleTransactionModel.fromJson(Map<String, dynamic> json) =>
      _$AppleTransactionModelFromJson(json);

}