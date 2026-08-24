class AppleTransactionEntity {
  final String transactionId;
  final String originalTransactionId;
  final String webOrderLineItemId;
  final String bundleId;
  final String productId;
  final String subscriptionGroupIdentifier;
  final int purchaseDate;
  final int originalPurchaseDate;
  final int expiresDate;
  final int quantity;
  final String type;
  final String inAppOwnershipType;
  final int signedDate;
  final String environment;
  final String storefront;
  final String storefrontId;
  final String transactionReason;

  const AppleTransactionEntity({
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
}