import 'package:hive_ce/hive.dart';

part 'pending_purchase_model.g.dart';

@HiveType(typeId: 4)
class PendingPurchaseCache {
  @HiveField(0)
  final String? purchaseId;

  @HiveField(1)
  final String productId;

  @HiveField(2)
  final String? transactionDate;

  @HiveField(3)
  final String status;

  @HiveField(4)
  final String purchaseToken;

  @HiveField(5)
  final String verificationSource;

  @HiveField(6)
  final bool pendingCompletePurchase;

  @HiveField(7)
  final String description;

  @HiveField(8)
  final String price;

  @HiveField(9)
  final String? title;

  const PendingPurchaseCache({
    required this.purchaseId,
    required this.productId,
    required this.transactionDate,
    required this.status,
    required this.purchaseToken,
    required this.verificationSource,
    required this.pendingCompletePurchase,
    required this.description,
    required this.price,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'purchase_id': purchaseId,
      'product_id': productId,
      'transaction_date': transactionDate,
      'status': status,
      'purchase_token': purchaseToken,
      'verification_source': verificationSource,
      'pending_complete_purchase': pendingCompletePurchase,
      'description': description,
      'price': price,
      'title': title,
    };
  }

  factory PendingPurchaseCache.fromMap(Map<dynamic, dynamic> map) {
    return PendingPurchaseCache(
      purchaseId: map['purchase_id']?.toString(),
      productId: map['product_id']?.toString() ?? '',
      transactionDate: map['transaction_date']?.toString(),
      status: map['status']?.toString() ?? '',
      purchaseToken: map['purchase_token']?.toString() ?? '',
      verificationSource: map['verification_source']?.toString() ?? '',
      pendingCompletePurchase:
          (map['pending_complete_purchase'] as bool?) ?? false,
      description: map['description']?.toString() ?? '',
      price: map['price']?.toString() ?? '',
      title: map['title']?.toString() ?? '',
    );
  }
}
