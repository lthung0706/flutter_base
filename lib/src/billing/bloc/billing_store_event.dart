part of 'billing_store_bloc.dart';

abstract class BillingStoreEvent extends Equatable {
  const BillingStoreEvent();

  @override
  List<Object> get props => [];
}

class GetStoreItemEvent extends BillingStoreEvent {
  const GetStoreItemEvent();
}

class CreateBillStoreEvent extends BillingStoreEvent {
  final BillingStoreCreateBody body;
  const CreateBillStoreEvent({required this.body});

  @override
  List<Object> get props => [body];
}

class UpdateBillStoreEvent extends BillingStoreEvent {
  final BillingStoreUpdateStatusBody body;
  const UpdateBillStoreEvent({required this.body});

  @override
  List<Object> get props => [body];
}

class GetBillingProductDetailsEvent extends BillingStoreEvent {
  final Set<String> productIds;
  const GetBillingProductDetailsEvent({required this.productIds});

  @override
  List<Object> get props => [productIds];
}

class VerifyAppleReceiptEvent extends BillingStoreEvent {
  final AppleVerifyReceiptBody body;
  final BillingStoreCreateBody createBody;
  const VerifyAppleReceiptEvent({required this.body, required this.createBody});

  @override
  List<Object> get props => [body, createBody];
}

class CreateFromPurchasedBillStoreEvent extends BillingStoreEvent {
  final BillingStoreCreateBody body;
  const CreateFromPurchasedBillStoreEvent({required this.body});

  @override
  List<Object> get props => [body];
}

class SetPendingPurchaseCacheEvent extends BillingStoreEvent {
  final PendingPurchaseCache cacheData;
  const SetPendingPurchaseCacheEvent({required this.cacheData});

  @override
  List<Object> get props => [cacheData];
}
