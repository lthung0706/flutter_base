import 'package:injectable/injectable.dart';
import 'package:report_person/src/core/params/billing_store_create_body.dart';
import 'package:report_person/src/data/models/data/data.dart';
import 'package:report_person/src/domain/entities/billing_store.dart';

import '../data/models/usecase/usecase.dart';

import 'billing_store_repository.dart';

@injectable
class CreateBillStoreUsecase
    implements UseCase<DataState<BillingStore>, BillingStoreCreateBody> {
  final BillingStoreRepository _repository;

  CreateBillStoreUsecase({required BillingStoreRepository repository})
    : _repository = repository;

  @override
  Future<DataState<BillingStore>> call({
    required BillingStoreCreateBody params,
  }) {
    return _repository.createBillingProduct(params);
  }
}
