import 'package:app_config/app_config.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/params/apple_verify_receipt_body.dart';
import '../../../core/params/billing_store_create_body.dart';
import '../../../core/params/billing_store_update_status_body.dart';
import '../../models/apple_transaction_model.dart';
import '../../models/billing_store_model.dart';
import '../../models/generic_respone_model.dart';

part 'billing_product_api_service.g.dart';

@RestApi()
abstract class BillingProductApiService {
  factory BillingProductApiService(final Dio dio, {final String baseUrl}) =
      _BillingProductApiService;

  @GET('${EndPoints.billingStore}/store-items')
  Future<HttpResponse<GenericResponseModel<List<StoreItemModel>>?>>
  getBillingProductList({@Header('isMockUp') final bool? isMockUp});

  @POST('${EndPoints.billingStore}/create-bill-store')
  Future<HttpResponse<GenericResponseModel<BillingStoreModel>?>>
  createBillStore(
    @Body() final BillingStoreCreateBody params, {
    @Header('isMockUp') final bool? isMockUp,
  });

  @PUT('${EndPoints.billingStore}/update-status-bill-store')
  Future<HttpResponse<GenericResponseModel<BillingStoreModel>?>>
  updateBillStore(
    @Body() final BillingStoreUpdateStatusBody params, {
    @Header('isMockUp') final bool? isMockUp,
  });

  @POST('/api/v1/apple/verify')
  Future<HttpResponse<GenericResponseModel<AppleTransactionModel>?>> verifyAppleReceipt(
    @Body() final AppleVerifyReceiptBody params, {
    @Header('isMockUp') final bool? isMockUp,
  });
}
