import 'package:flutter_base/src/data/models/local/pending_purchase_model.dart';
import 'package:flutter_base/src/data/models/usecase/usecase.dart';

import 'billing_store_repository.dart';

class SavePendingPurchaseUsecase
    implements UseCase<void, PendingPurchaseCache> {
  final BillingStoreRepository _repository;

  SavePendingPurchaseUsecase(this._repository);

  @override
  Future<void> call({required PendingPurchaseCache params}) {
    return _repository.savePendingPurchase(params);
  }
}
