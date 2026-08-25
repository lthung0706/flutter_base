import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_base/src/data/models/data/data.dart';
import 'package:flutter_base/src/data/models/usecase/usecase.dart';

import 'billing_store_repository.dart';

@injectable
class GetBillingProductDetailsUsecase
    implements UseCase<DataState<List<ProductDetails>>, Set<String>> {
  final BillingStoreRepository _repository;

  GetBillingProductDetailsUsecase({required BillingStoreRepository repository})
    : _repository = repository;

  @override
  Future<DataState<List<ProductDetails>>> call({required Set<String> params}) {
    return _repository.getBillingProductDetail(params);
  }
}
