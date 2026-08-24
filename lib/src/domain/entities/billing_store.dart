class BillingStore {
  BillingStore({
    this.id,
    this.createdBy,
    this.purchaseAt,
    this.purchaseToken,
    this.status,
    this.status2,
    this.purchaseId,
    this.createdAt,
    this.isRestore,
    this.productId,
    this.source,
  });

  final String? id;
  final String? createdAt;
  final String? createdBy;
  final String? purchaseAt;
  final String? purchaseToken;
  final String? status;
  final String? status2;
  final String? purchaseId;
  final bool? isRestore;
  final String? productId;
  final String? source;

  BillingStore copyWith({
    String? id,
    String? createdAt,
    String? createdBy,
    String? purchaseAt,
    String? purchaseToken,
    String? status,
    String? purchaseId,
  }) {
    return BillingStore(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      createdBy: createdBy ?? this.createdBy,
      purchaseAt: purchaseAt ?? this.purchaseAt,
      purchaseToken: purchaseToken ?? this.purchaseToken,
      status: status ?? this.status,
      purchaseId: purchaseId ?? this.purchaseId,
    );
  }
}

class StoreItem {
  StoreItem({this.id});

  final String? id;

  StoreItem copyWith({String? id}) {
    return StoreItem(id: id ?? this.id);
  }
}
