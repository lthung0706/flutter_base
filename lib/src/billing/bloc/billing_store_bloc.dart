import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_base/src/billing/create_bill_store_usecase.dart';
import 'package:flutter_base/src/billing/get_billing_product_details_usecase.dart';
import 'package:flutter_base/src/billing/get_store_item_usecase.dart';
import 'package:flutter_base/src/billing/update_bill_store_usecase.dart';
import 'package:flutter_base/src/billing/verify_apple_receipt_usecase.dart';
import 'package:flutter_base/src/data/models/data/data.dart';
import 'package:flutter_base/src/data/models/local/pending_purchase_model.dart';

import '../../core/params/apple_verify_receipt_body.dart';
import '../../core/params/billing_store_create_body.dart';
import '../../core/params/billing_store_update_status_body.dart';

part 'billing_store_event.dart';
part 'billing_store_state.dart';

@injectable
class BillingStoreBloc extends Bloc<BillingStoreEvent, BillingStoreState> {
  final GetStoreItemUsecase _getStoreItemUsecase;
  final CreateBillStoreUsecase _createBillStoreUsecase;
  final UpdateBillStoreUsecase _updateBillStoreUsecase;
  final GetBillingProductDetailsUsecase _getBillingProductDetailsUsecase;
  final VerifyAppleReceiptUsecase _verifyAppleReceiptUsecase;
  BillingStoreBloc(
    this._getStoreItemUsecase,
    this._createBillStoreUsecase,
    this._updateBillStoreUsecase,
    this._getBillingProductDetailsUsecase,
    this._verifyAppleReceiptUsecase,
  ) : super(const BillingStoreState(BillingStoreStateStatus.init)) {
    on<GetStoreItemEvent>(_onGetStoreItem);
    on<CreateBillStoreEvent>(_onCreateBillStore);
    on<UpdateBillStoreEvent>(_onUpdateBillStore);
    on<GetBillingProductDetailsEvent>(_onGetBillingProductDetails);
    on<VerifyAppleReceiptEvent>(_onVerifyAppleReceipt);
    on<CreateFromPurchasedBillStoreEvent>(_onCreateFromPurchasedBillStore);
    on<SetPendingPurchaseCacheEvent>(_onSetPendingPurchaseCache);
  }
  FutureOr<void> _onGetStoreItem(
    GetStoreItemEvent event,
    Emitter<BillingStoreState> emit,
  ) async {
    emit(state.copyWith(BillingStoreStateStatus.loading));
    final result = await _getStoreItemUsecase(params: ());
    if (result is DataSuccess) {
      emit(
        state.copyWith(
          BillingStoreStateStatus.gotProductList,
          data: result.data ?? [],
        ),
      );
    } else {
      emit(
        state.copyWith(
          BillingStoreStateStatus.failure,
          data: result.error?.message,
        ),
      );
    }
  }

  FutureOr<void> _onCreateBillStore(
    CreateBillStoreEvent event,
    Emitter<BillingStoreState> emit,
  ) async {
    emit(state.copyWith(BillingStoreStateStatus.loading));
    final result = await _createBillStoreUsecase(params: event.body);
    if (result is DataSuccess) {
      emit(
        state.copyWith(
          BillingStoreStateStatus.createBillingStore,
          data: result.data ?? [],
        ),
      );
    } else {
      emit(
        state.copyWith(
          BillingStoreStateStatus.failure,
          data: result.error?.message,
        ),
      );
    }
  }

  FutureOr<void> _onUpdateBillStore(
    UpdateBillStoreEvent event,
    Emitter<BillingStoreState> emit,
  ) async {
    emit(state.copyWith(BillingStoreStateStatus.loading));
    final result = await _updateBillStoreUsecase(params: event.body);
    if (result is DataSuccess) {
      emit(
        state.copyWith(
          BillingStoreStateStatus.updateBillingStore,
          data: result.data ?? [],
        ),
      );
    } else {
      emit(
        state.copyWith(
          BillingStoreStateStatus.failure,
          data: result.error?.message,
        ),
      );
    }
  }

  FutureOr<void> _onGetBillingProductDetails(
    GetBillingProductDetailsEvent event,
    Emitter<BillingStoreState> emit,
  ) async {
    emit(state.copyWith(BillingStoreStateStatus.loading));
    final result = await _getBillingProductDetailsUsecase(
      params: event.productIds,
    );
    if (result is DataSuccess) {
      emit(
        state.copyWith(
          BillingStoreStateStatus.gotProductDetail,
          data: result.data ?? [],
        ),
      );
    } else {
      emit(
        state.copyWith(
          BillingStoreStateStatus.failure,
          data: result.error?.message,
        ),
      );
    }
  }

  FutureOr<void> _onVerifyAppleReceipt(
    VerifyAppleReceiptEvent event,
    Emitter<BillingStoreState> emit,
  ) async {
    emit(state.copyWith(BillingStoreStateStatus.loading));
    final result = await _verifyAppleReceiptUsecase(params: event.body);
    if (result is DataSuccess) {
      emit(
        state.copyWith(
          BillingStoreStateStatus.verifyAppleReceiptSuccess,
          data: result.data ?? [],
        ),
      );
    } else {
      emit(
        state.copyWith(
          BillingStoreStateStatus.verifyAppleReceiptFailure,
          data: result.error?.message,
        ),
      );
    }
  }

  FutureOr<void> _onCreateFromPurchasedBillStore(
    CreateFromPurchasedBillStoreEvent event,
    Emitter<BillingStoreState> emit,
  ) async {
    emit(state.copyWith(BillingStoreStateStatus.loading));
    final result = await _createBillStoreUsecase(params: event.body);
    if (result is DataSuccess) {
      emit(
        state.copyWith(
          BillingStoreStateStatus.createBillingStore,
          data: result.data ?? [],
        ),
      );
    } else {
      emit(
        state.copyWith(
          BillingStoreStateStatus.failure,
          data: result.error?.message,
        ),
      );
    }
  }

  FutureOr<void> _onSetPendingPurchaseCache(
    SetPendingPurchaseCacheEvent event,
    Emitter<BillingStoreState> emit,
  ) {
    emit(
      state.copyWith(
        BillingStoreStateStatus.hasPendingPurchaseCache,
        data: event.cacheData,
      ),
    );
  }
}
