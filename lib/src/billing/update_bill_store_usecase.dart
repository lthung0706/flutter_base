import 'package:injectable/injectable.dart';
import 'package:flutter_base/src/core/params/billing_store_update_status_body.dart';
import 'package:flutter_base/src/data/models/data/data.dart';
import 'package:flutter_base/src/domain/entities/billing_store.dart';

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
