import 'package:injectable/injectable.dart';
import 'package:report_person/src/core/params/billing_store_update_status_body.dart';
import 'package:report_person/src/data/models/data/data.dart';
import 'package:report_person/src/domain/entities/billing_store.dart';

import '../data/models/usecase/usecase.dart';

import 'billing_store_repository.dart';

@injectable
class UpdateBillStoreUsecase
    implements UseCase<DataState<BillingStore>, BillingStoreUpdateStatusBody> {
  final BillingStoreRepository _repository;

  UpdateBillStoreUsecase({required BillingStoreRepository repository})
    : _repository = repository;

  @override
  Future<DataState<BillingStore>> call({
    required BillingStoreUpdateStatusBody params,
  }) {
    return _repository.updateBillingProduct(params);
  }
}
