import 'package:flutter_base/src/data/models/usecase/usecase.dart';

import 'billing_store_repository.dart';

class ClearPendingPurchaseUsecase implements UseCase<void, void> {
  final BillingStoreRepository _repository;

  ClearPendingPurchaseUsecase(this._repository);

  @override
  Future<void> call({void params}) {
    return _repository.clearPendingPurchase();
  }
}
