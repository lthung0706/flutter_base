import 'package:report_person/src/data/models/local/pending_purchase_model.dart';
import 'package:report_person/src/data/models/usecase/usecase.dart';

import 'billing_store_repository.dart';

class GetPendingPurchaseUsecase
    implements UseCase<PendingPurchaseCache?, void> {
  final BillingStoreRepository _repository;

  GetPendingPurchaseUsecase(this._repository);

  @override
  Future<PendingPurchaseCache?> call({void params}) {
    return _repository.getPendingPurchase();
  }
}
