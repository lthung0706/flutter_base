import 'package:injectable/injectable.dart';
import 'package:flutter_base/src/core/params/apple_verify_receipt_body.dart';
import 'package:flutter_base/src/data/models/data/data.dart';
import 'package:flutter_base/src/domain/entities/apple_transaction.dart';

import '../data/models/usecase/usecase.dart';
import 'billing_store_repository.dart';

@injectable
class VerifyAppleReceiptUsecase
    implements UseCase<DataState<AppleTransactionEntity>, AppleVerifyReceiptBody> {
  final BillingStoreRepository _repository;

  VerifyAppleReceiptUsecase({required BillingStoreRepository repository})
    : _repository = repository;

  @override
  Future<DataState<AppleTransactionEntity>> call({required AppleVerifyReceiptBody params}) {
    return _repository.verifyAppleReceipt(params);
  }
}
