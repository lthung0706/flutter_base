import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class BillingProductService {
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;

  BillingProductService();

  Future<BillingProductQueryResult> queryById(Set<String> productIds) async {
    final ProductDetailsResponse response = await _inAppPurchase
        .queryProductDetails(productIds);
    return BillingProductQueryResult(
      storeAvailable: true,
      product: response.productDetails,
      notFoundIds: response.notFoundIDs,
      error: response.error,
    );
  }
}

class BillingProductQueryResult {
  const BillingProductQueryResult({
    required this.storeAvailable,
    this.product,
    this.notFoundIds = const <String>[],
    this.error,
  });

  final bool storeAvailable;
  final List<ProductDetails>? product;
  final List<String> notFoundIds;
  final IAPError? error;

  bool get hasProduct => product?.isNotEmpty ?? false;
}
