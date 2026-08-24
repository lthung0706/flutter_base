part of 'billing_store_bloc.dart';

enum BillingStoreStateStatus {
  init,
  loading,
  gotProductList,
  gotProductDetail,
  hasPendingPurchaseCache,
  createBillingStore,
  updateBillingStore,
  verifyAppleReceiptSuccess,
  verifyAppleReceiptFailure,
  failure,
}

@immutable
class BillingStoreState extends Equatable {
  const BillingStoreState(this.status, {this.data});
  final dynamic data;
  final BillingStoreStateStatus status;

  BillingStoreState copyWith(
    final BillingStoreStateStatus status, {
    final dynamic data,
  }) {
    return BillingStoreState(status, data: data);
  }

  @override
  List<Object?> get props => [status, data];
}
