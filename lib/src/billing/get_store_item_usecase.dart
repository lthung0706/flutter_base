import 'package:injectable/injectable.dart';
import 'package:report_person/src/data/models/data/data.dart';
import 'package:report_person/src/domain/entities/billing_store.dart';

import '../data/models/usecase/usecase.dart';

import 'billing_store_repository.dart';

@injectable
class GetStoreItemUsecase implements UseCase<DataState<List<StoreItem>>, void> {
  final BillingStoreRepository _repository;

  GetStoreItemUsecase({required BillingStoreRepository repository})
    : _repository = repository;

  @override
  Future<DataState<List<StoreItem>>> call({required void params}) {
    return _repository.getBillingProductList();
  }
}
