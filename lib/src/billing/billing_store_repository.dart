import 'dart:convert';

import 'package:app_config/app_config.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:injectable/injectable.dart';
import 'package:report_person/src/core/constants/key_local_store.dart';
import 'package:report_person/src/core/hive_service_helper.dart';
import 'package:report_person/src/data/models/apple_transaction_model.dart';
import 'package:report_person/src/data/models/data/data.dart';
import 'package:report_person/src/data/models/error/api_error.dart';
import 'package:report_person/src/data/models/extensions/dio_response.dart';
import 'package:report_person/src/data/models/local/pending_purchase_model.dart';
import 'package:report_person/src/domain/entities/apple_transaction.dart';
import 'package:report_person/src/module/injector.dart';

import '../core/params/apple_verify_receipt_body.dart';
import '../core/params/billing_store_create_body.dart';
import '../core/params/billing_store_update_status_body.dart';
import '../data/datasources/remote/billing_product_api_service.dart';
import '../data/models/billing_store_model.dart';
import '../domain/entities/billing_store.dart';
import '../mapper/mappers.dart';
import 'billing_product_service.dart';

abstract interface class BillingStoreRepository {
  Future<DataState<List<StoreItem>>> getBillingProductList();
  Future<DataState<List<ProductDetails>>> getBillingProductDetail(
    final Set<String> productIds,
  );
  Future<DataState<BillingStore>> createBillingProduct(
    final BillingStoreCreateBody params,
  );
  Future<DataState<BillingStore>> updateBillingProduct(
    final BillingStoreUpdateStatusBody params,
  );
  Future<DataState<AppleTransactionEntity>> verifyAppleReceipt(
    final AppleVerifyReceiptBody params,
  );
  Future<void> savePendingPurchase(final PendingPurchaseCache params);
  Future<PendingPurchaseCache?> getPendingPurchase();
  Future<void> clearPendingPurchase();
}

@LazySingleton(as: BillingStoreRepository)
class BillingStoreRepositoryImpl implements BillingStoreRepository {
  final BillingProductApiService _billingProductApiService;
  final BillingProductService _billingProductService;

  BillingStoreRepositoryImpl(
    this._billingProductApiService,
    this._billingProductService,
  );

  @override
  Future<DataState<AppleTransactionEntity>> verifyAppleReceipt(
    final AppleVerifyReceiptBody params,
  ) async {
    try {
      final httpResponse = await _billingProductApiService.verifyAppleReceipt(
        params,
        isMockUp: false,
      );
      if (httpResponse.data?.success ?? false) {
        final data = getIt<Mapper>().tryConvert<AppleTransactionModel, AppleTransactionEntity>(httpResponse.data?.data);
        return DataSuccess(data);
      } else {
        return DataFailure(
          ApiError(message: httpResponse.response.statusMessage),
        );
      }
    } on DioException catch (error) {
      return DataFailure(error.response?.apiError);
    } catch (_) {
      return const DataFailure(null);
    }
  }

  @override
  Future<DataState<BillingStore>> createBillingProduct(
    final BillingStoreCreateBody params,
  ) async {
    try {
      final httpResponse = await _billingProductApiService.createBillStore(
        params,
        isMockUp: false,
      );
      if (httpResponse.data?.success ?? false) {
        final data = getIt<Mapper>().convert<BillingStoreModel, BillingStore>(
          httpResponse.data?.data,
        );
        return DataSuccess(data);
      } else {
        return DataFailure(
          ApiError(message: httpResponse.response.statusMessage),
        );
      }
    } on DioException catch (error) {
      return DataFailure(error.response?.apiError);
    } catch (_) {
      return const DataFailure(null);
    }
  }

  @override
  Future<DataState<List<StoreItem>>> getBillingProductList() async {
    try {
      final httpResponse = await _billingProductApiService
          .getBillingProductList(isMockUp: false);
      if (httpResponse.data?.success ?? false) {
        final data = getIt<Mapper>().convertList<StoreItemModel, StoreItem>(
          httpResponse.data?.data ?? [],
        );
        return DataSuccess(data);
      } else {
        return DataFailure(
          ApiError(message: httpResponse.response.statusMessage),
        );
      }
    } on DioException catch (error) {
      return DataFailure(error.response?.apiError);
    } catch (_) {
      return const DataFailure(null);
    }
  }

  @override
  Future<DataState<BillingStore>> updateBillingProduct(
    final BillingStoreUpdateStatusBody params,
  ) async {
    try {
      final httpResponse = await _billingProductApiService.updateBillStore(
        params,
        isMockUp: false,
      );
      if (httpResponse.data?.success ?? false) {
        final data = getIt<Mapper>().convert<BillingStoreModel, BillingStore>(
          httpResponse.data?.data,
        );
        return DataSuccess(data);
      } else {
        return DataFailure(
          ApiError(message: httpResponse.response.statusMessage),
        );
      }
    } on DioException catch (error) {
      return DataFailure(error.response?.apiError);
    } catch (_) {
      return const DataFailure(null);
    }
  }

  @override
  Future<DataState<List<ProductDetails>>> getBillingProductDetail(
    final Set<String> productIds,
  ) async {
    try {
      if (productIds.isEmpty) return const DataSuccess([]);
      final httpResponse = await _billingProductService.queryById(productIds);
      if (httpResponse.product?.isNotEmpty ?? false) {
        return DataSuccess(httpResponse.product);
      } else {
        final message =
            httpResponse.error?.message ??
            'StoreKit không trả về sản phẩm. '
                'notFoundIDs=${httpResponse.notFoundIds}';
        return DataFailure(ApiError(message: message));
      }
    } on DioException catch (error) {
      return DataFailure(error.response?.apiError);
    } catch (_) {
      return const DataFailure(null);
    }
  }

  @override
  Future<void> savePendingPurchase(final PendingPurchaseCache params) {
    return getIt<HiveServiceHelper>().saveBox<dynamic>(
      BoxName.pendingPurchase,
      params,
    );
  }

  @override
  Future<PendingPurchaseCache?> getPendingPurchase() async {
    final data = await getIt<HiveServiceHelper>().getBox<dynamic>(
      BoxName.pendingPurchase,
    );
    if (data == null) return null;
    if (data is PendingPurchaseCache) {
      return data;
    }
    if (data is String) {
      if (data.isEmpty) return null;
      try {
        final decoded = jsonDecode(data);
        if (decoded is Map) {
          final migrated = PendingPurchaseCache.fromMap(decoded);
          await savePendingPurchase(migrated);
          return migrated;
        }
      } catch (_) {
        return null;
      }
      return null;
    }
    if (data is Map) {
      final migrated = PendingPurchaseCache.fromMap(data);
      await savePendingPurchase(migrated);
      return migrated;
    }
    return null;
  }

  @override
  Future<void> clearPendingPurchase() {
    return getIt<HiveServiceHelper>().saveBox<dynamic>(
      BoxName.pendingPurchase,
      '',
    );
  }
}
