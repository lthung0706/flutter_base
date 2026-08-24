import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:io';

import 'package:app_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:sstrip/src/billing/billing_store_repository.dart';
import 'package:sstrip/src/billing/clear_pending_purchase_usecase.dart';
import 'package:sstrip/src/billing/get_pending_purchase_usecase.dart';
import 'package:sstrip/src/billing/save_pending_purchase_usecase.dart';
import 'package:sstrip/src/authentication/view/authentication_page.dart';
import 'package:sstrip/src/core/params/apple_verify_receipt_body.dart';
import 'package:sstrip/src/core/params/billing_store_create_body.dart';
import 'package:sstrip/src/core/params/billing_store_update_status_body.dart';
import 'package:sstrip/src/data/models/local/pending_purchase_model.dart';
import 'package:sstrip/src/domain/entities/apple_transaction.dart';
import 'package:sstrip/src/domain/entities/billing_store.dart';
import 'package:sstrip/src/core/firebase_analytics_helper.dart';
import 'package:sstrip/src/core/firebase_performance_helper.dart';

import 'package:sstrip/src/module/injector.dart';


import '../../components/app_snackbar.dart';
import '../../utils/value_notifier_list.dart';
import '../bloc/billing_store_bloc.dart';
import '../components/billing_card_badege.dart';

class BillingPage extends StatefulWidget {
  const BillingPage({super.key});
  static final ValueNotifierList<ProductDetails> vProducts = ValueNotifierList(
    [],
  );
  @override
  State<BillingPage> createState() => _BillingPageState();
}

class _BillingPageState extends State<BillingPage> {
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  StreamSubscription<List<PurchaseDetails>>? _purchaseSubscription;
  late final BillingStoreBloc _billingStoreBloc;
  
  late final SavePendingPurchaseUsecase _savePendingPurchaseUsecase;
  late final GetPendingPurchaseUsecase _getPendingPurchaseUsecase;
  late final ClearPendingPurchaseUsecase _clearPendingPurchaseUsecase;

  String updateId = '';
  bool _isPurchasing = false;
  String _statusMessage = 'Đang khởi tạo Billing...';
  PurchaseDetails? _pendingPurchase;
  PendingPurchaseCache? _pendingPurchaseCacheData;

  // Sản phẩm đang được chọn (radio) trong danh sách gói. Người dùng chọn 1
  // gói ở đây, rồi bấm nút "Mua" chung ở cuối màn hình để thanh toán, thay vì
  // mỗi card có 1 nút mua riêng như trước.
  String? _selectedProductId;

  // Giữ lại createBody đã build lúc dispatch VerifyAppleReceiptEvent, để dùng
  // ngay sau khi verifyAppleReceiptSuccess -> CreateBillStoreEvent, thay vì
  // phụ thuộc vào state.data của bloc trả về đúng kiểu.
  BillingStoreCreateBody? _pendingCreateBody;

  Timer? _pendingErrorTimer;

  // Guard chống double-delivery từ purchaseStream: purchaseStream là 1
  // broadcast stream, nên nếu vì lý do gì đó có 2 subscription cùng lắng
  // nghe nó (ví dụ initState chạy 2 lần do widget bị remount trong khi
  // dispose() của instance cũ chưa kịp cancel subscription cũ), hoặc
  // transaction chưa được finishTransaction nên StoreKit đẩy lại y hệt
  // event cũ, thì cùng 1 purchaseID/productID sẽ được xử lý 2 lần, dẫn tới
  // gọi verify/create bill 2 lần với cùng dữ liệu. Set này đảm bảo mỗi
  // giao dịch chỉ được xử lý 1 lần tại một thời điểm.
  final Set<String> _inflightPurchaseIds = {};

  @override
  void initState() {
    super.initState();
    _billingStoreBloc = getIt<BillingStoreBloc>();
    
    final billingRepository = getIt<BillingStoreRepository>();
    _savePendingPurchaseUsecase = SavePendingPurchaseUsecase(billingRepository);
    _getPendingPurchaseUsecase = GetPendingPurchaseUsecase(billingRepository);
    _clearPendingPurchaseUsecase = ClearPendingPurchaseUsecase(
      billingRepository,
    );
    _initBillingFlow();

    _purchaseSubscription = _inAppPurchase.purchaseStream.listen(
      _listenToPurchaseUpdates,
      onError: (Object error) {
        if (!mounted) return;
        setState(() {
          debugPrint('Lỗi luồng purchase: $error');
          _isPurchasing = false;
        });
      },
    );
  }

  Future<void> _initBillingFlow() async {
    final cachedPendingPurchase = await _getPendingPurchaseFromCache();
    if (cachedPendingPurchase != null) {
      _pendingPurchaseCacheData = cachedPendingPurchase;
      _billingStoreBloc.add(
        SetPendingPurchaseCacheEvent(cacheData: cachedPendingPurchase),
      );
      return;
    }
    _billingStoreBloc.add(const GetStoreItemEvent());
  }

  @override
  void dispose() {
    _pendingErrorTimer?.cancel();
    _purchaseSubscription?.cancel();
    super.dispose();
  }

  bool _isSubscription(ProductDetails product) {
    if (product is GooglePlayProductDetails) {
      return product.productDetails.productType == ProductType.subs;
    }
    if (product is AppStoreProductDetails) {
      return product.skProduct.subscriptionPeriod != null;
    }
    return false;
  }

  // Tìm sản phẩm đang được chọn (radio) trong danh sách sản phẩm hiện có.
  // Trả về null nếu chưa chọn hoặc id đã chọn không còn nằm trong danh sách.
  ProductDetails? _findSelectedProduct(List<ProductDetails> products) {
    for (final product in products) {
      if (product.id == _selectedProductId) return product;
    }
    return null;
  }

  Future<void> _buyProduct(ProductDetails product) async {
    if (_isPurchasing) return;

    FirebaseAnalyticsHelper.logEvent(
      name: 'purchase_initiated',
      parameters: {'product_id': product.id, 'price': product.price},
    );
    FirebasePerformanceHelper.startTrace('in_app_purchase_flow');

    setState(() {
      _isPurchasing = true;
      debugPrint('Đang mở màn hình thanh toán cho ${product.id}...');
    });

    final PurchaseParam purchaseParam = PurchaseParam(productDetails: product);

    final bool isSubscription = _isSubscription(product);
    bool purchaseStarted = false;

    try {
      if (isSubscription) {
        purchaseStarted = await _inAppPurchase.buyNonConsumable(
          purchaseParam: purchaseParam,
        );
      } else {
        purchaseStarted = await _inAppPurchase.buyConsumable(
          purchaseParam: purchaseParam,
        );
      }
    } on PlatformException catch (e) {
      FirebasePerformanceHelper.stopTrace('in_app_purchase_flow');
      final bool likelyUserCancelled = e.code.toLowerCase().contains('cancel');
      FirebaseAnalyticsHelper.logEvent(
        name: likelyUserCancelled
            ? 'purchase_cancelled_by_user'
            : 'purchase_initiation_exception',
        parameters: {
          'product_id': product.id,
          'error_code': e.code,
          'error_message': e.message ?? '',
        },
      );
      if (!mounted) return;
      setState(() {
        _isPurchasing = false;
        _statusMessage = likelyUserCancelled
            ? 'Bạn đã hủy giao dịch.'
            : 'Không thể kết nối tới Store (${e.code}). Vui lòng thử lại sau.';
      });
      return;
    } catch (e) {
      // Bắt luôn các lỗi không phải PlatformException để không bao giờ để
      // sót 1 nhánh throw nào làm kẹt _isPurchasing hoặc rò rỉ trace.
      FirebasePerformanceHelper.stopTrace('in_app_purchase_flow');
      FirebaseAnalyticsHelper.logEvent(
        name: 'purchase_initiation_exception',
        parameters: {'product_id': product.id, 'error': e.toString()},
      );
      if (!mounted) return;
      setState(() {
        _isPurchasing = false;
        _statusMessage =
            'Đã có lỗi xảy ra khi khởi tạo thanh toán. Vui lòng thử lại.';
      });
      return;
    }

    if (!mounted) return;
    if (!purchaseStarted) {
      FirebasePerformanceHelper.stopTrace('in_app_purchase_flow');
      FirebaseAnalyticsHelper.logEvent(
        name: 'purchase_initiation_failed',
        parameters: {'product_id': product.id},
      );
      setState(() {
        _isPurchasing = false;
        debugPrint('Không thể khởi tạo thanh toán. Vui lòng thử lại.');
      });
    }
  }

  Future<void> _cachePurchaseToHive(PurchaseDetails purchase) async {
    ProductDetails? matchedProduct;
    for (final product in BillingPage.vProducts.value) {
      if (product.id == purchase.productID) {
        matchedProduct = product;
        break;
      }
    }

    await _savePendingPurchaseUsecase.call(
      params: PendingPurchaseCache(
        title: matchedProduct?.title.split('(').first,
        purchaseId: purchase.purchaseID,
        productId: purchase.productID,
        transactionDate: purchase.transactionDate,
        status: purchase.status.name,
        purchaseToken: purchase.verificationData.serverVerificationData,
        verificationSource: purchase.verificationData.source,
        pendingCompletePurchase: purchase.pendingCompletePurchase,
        description: matchedProduct?.description ?? '',
        price: matchedProduct?.price ?? '',
      ),
    );
  }

  /// Cache lại cục bộ ngay sau khi verify Apple receipt thành công, TRƯỚC khi
  /// gọi CreateBillStoreEvent. Dùng status riêng 'apple_verified' (khác với
  /// 'purchased' mà _cachePurchaseToHive ghi lúc Store vừa trả purchase) để
  /// _getPendingPurchaseFromCache/_onTapPendingPurchaseCard có thể phân biệt:
  /// nếu app bị kill ở giữa bước tạo bill, lần mở lại biết được Apple đã
  /// verify xong, chỉ còn thiếu create + update trên server SStrip.
  ///
  /// Lưu ý: hàm _getPendingPurchaseFromCache hiện tại chỉ coi cache hợp lệ
  /// khi status là 'purchased' hoặc 'restored' (PurchaseStatus enum). Nếu
  /// muốn resume tự động đúng bước "đã verify, cần create" ở lần mở app kế
  /// tiếp, cần mở rộng điều kiện đó để nhận thêm status 'apple_verified' -
  /// xem ghi chú ở _getPendingPurchaseFromCache bên dưới.
  Future<void> _cachePendingCreateBodyToHive(
    BillingStoreCreateBody createBody,
  ) async {
    await _savePendingPurchaseUsecase.call(
      params: PendingPurchaseCache(
        title: createBody.productName,
        purchaseId: _pendingPurchase?.purchaseID,
        productId: createBody.productId,
        transactionDate: createBody.purchaseAt,
        status: 'apple_verified',
        purchaseToken: createBody.purchaseToken,
        verificationSource: _pendingPurchase?.verificationData.source ?? '',
        pendingCompletePurchase:
            _pendingPurchase?.pendingCompletePurchase ?? false,
        description: '',
        price: '',
      ),
    );
  }

  Future<PendingPurchaseCache?> _getPendingPurchaseFromCache() async {
    final pendingPurchase = await _getPendingPurchaseUsecase.call();
    if (pendingPurchase == null) {
      return null;
    }
    // 'apple_verified': cache được ghi ngay sau khi verify Apple receipt
    // thành công (trước bước create bill) — xem _cachePendingCreateBodyToHive.
    // Coi là hợp lệ để resume giống 'purchased'/'restored', vì bước tiếp
    // theo cần làm ở cả 3 trường hợp là như nhau: gọi lại CreateBillStore.
    final isResumable =
        pendingPurchase.status == PurchaseStatus.purchased.name ||
        pendingPurchase.status == PurchaseStatus.restored.name ||
        pendingPurchase.status == 'apple_verified';
    if (!isResumable) {
      return null;
    }
    return pendingPurchase;
  }

  Future<void> _cleanCachedPurchaseFromHive() async {
    _pendingPurchaseCacheData = null;
    await _clearPendingPurchaseUsecase.call();
  }

  bool _canCompletePurchase(PurchaseDetails purchase) {
    if (Platform.isAndroid) {
      return purchase.runtimeType.toString() == 'GooglePlayPurchaseDetails';
    }
    return true;
  }

  Future<void> _safeCompletePurchase(
    PurchaseDetails? purchase, {
    required String context,
  }) async {
    if (purchase == null) return;
    if (!_canCompletePurchase(purchase)) {
      debugPrint(
        'Skip completePurchase [$context]: invalid type ${purchase.runtimeType}',
      );
      return;
    }
    try {
      await _inAppPurchase.completePurchase(purchase);
    } catch (e) {
      debugPrint('completePurchase failed [$context]: $e');
    }
  }

  void _onTapPendingPurchaseCard() {
    if (_pendingPurchaseCacheData == null) return;

    if (_pendingPurchaseCacheData?.purchaseToken.isEmpty ?? false) {
      setState(() {
        _statusMessage =
            'Không tìm thấy purchase_token trong cache để cập nhật giao dịch.';
      });
      return;
    }

    setState(() {
      _isPurchasing = true;
      debugPrint('Đang cập nhật giao dịch pending...');
    });
    final userId = AuthenticationPage.user.id;
    final createBody = BillingStoreCreateBody(
      productName: _pendingPurchaseCacheData?.title ?? '',
      createdBy: userId,
      purchaseAt: _pendingPurchaseCacheData?.transactionDate ?? '',
      purchaseToken: _pendingPurchaseCacheData?.purchaseToken ?? '',
      status: _pendingPurchaseCacheData?.status ?? '',
      productId: _pendingPurchaseCacheData?.productId ?? '',
      isRestore: true,
      source: _pendingPurchaseCacheData?.verificationSource ?? '',
    );
    _billingStoreBloc.add(CreateFromPurchasedBillStoreEvent(body: createBody));
  }

  Future<void> _listenToPurchaseUpdates(
    List<PurchaseDetails> purchaseDetailsList,
  ) async {
    for (final PurchaseDetails purchase in purchaseDetailsList) {
      switch (purchase.status) {
        case PurchaseStatus.pending:
          if (!mounted) return;
          setState(() {
            debugPrint('Giao dịch đang chờ xác nhận...');
          });
          final userId = AuthenticationPage.user.id;
          final createBody = BillingStoreCreateBody(
            productName: BillingPage.vProducts.value
                .firstWhere((e) => e.id == purchase.productID)
                .title
                .split('(')
                .first,
            createdBy: userId,
            purchaseAt: purchase.transactionDate,
            purchaseToken: purchase.verificationData.serverVerificationData,
            status: purchase.status.name,
            productId: purchase.productID,
            isRestore: true,
            source: purchase.verificationData.source,
          );
          _pendingPurchase = purchase;
          _billingStoreBloc.add(CreateBillStoreEvent(body: createBody));

          break;
        case PurchaseStatus.purchased:
        case PurchaseStatus.restored:
          if (!mounted) return;

          // Guard chống double-delivery: nếu key này đang inflight (event
          // trùng lặp của cùng giao dịch được purchaseStream đẩy lại lần
          // nữa trong lúc lần xử lý trước chưa kết thúc), bỏ qua ngay tại
          // đây thay vì chạy lại toàn bộ verify + create bill.
          final String purchaseKey = purchase.purchaseID ?? purchase.productID;
          if (!_inflightPurchaseIds.add(purchaseKey)) {
            debugPrint('Bỏ qua purchase event trùng lặp cho key: $purchaseKey');
            return;
          }

          FirebaseAnalyticsHelper.logEvent(
            name: 'purchase_completed_store',
            parameters: {
              'product_id': purchase.productID,
              'purchase_id': purchase.purchaseID ?? '',
              'status': purchase.status.name,
            },
          );
          setState(() {
            _statusMessage =
                'Thanh toán thành công ở Store, đang xác thực với server...';
          });
          try {
            await _cachePurchaseToHive(purchase);
            _pendingPurchase = purchase;

            if (Platform.isIOS) {
              // Build sẵn createBody và giữ lại ở field của State, để dùng
              // ngay khi verifyAppleReceiptSuccess -> dispatch CreateBillStoreEvent
              // (giống pattern Android: insert trước, update sau).
              final iosCreateBody = BillingStoreCreateBody(
                productName: BillingPage.vProducts.value
                    .firstWhere((e) => e.id == purchase.productID)
                    .title
                    .split('(')
                    .first,
                createdBy: AuthenticationPage.user.id,
                purchaseAt: purchase.transactionDate,
                purchaseToken: purchase.verificationData.serverVerificationData,
                status: 'purchased',
                productId: purchase.productID,
                isRestore: true,
              );
              _pendingCreateBody = iosCreateBody;

              _billingStoreBloc.add(
                VerifyAppleReceiptEvent(
                  body: AppleVerifyReceiptBody(
                    transactionId: purchase.purchaseID ?? '',
                    signedTransactionInfo:
                        purchase.verificationData.serverVerificationData,
                  ),
                  createBody: iosCreateBody,
                ),
              );
            } else {
              if (_pendingPurchase?.status == PurchaseStatus.pending) {
                _pendingErrorTimer?.cancel();
                _billingStoreBloc.add(
                  UpdateBillStoreEvent(
                    body: BillingStoreUpdateStatusBody(
                      isRestore: false,
                      purchaseId: purchase.purchaseID ?? '',
                      status: purchase.status.name,
                      purchaseToken:
                          purchase.verificationData.serverVerificationData,
                    ),
                  ),
                );
              } else {
                final userId = AuthenticationPage.user.id;
                final createBody = BillingStoreCreateBody(
                  productName: BillingPage.vProducts.value
                      .firstWhere((e) => e.id == purchase.productID)
                      .title
                      .split('(')
                      .first,
                  createdBy: userId,
                  purchaseAt: purchase.transactionDate,
                  purchaseToken:
                      purchase.verificationData.serverVerificationData,
                  status: purchase.status.name,
                  productId: purchase.productID,
                  isRestore: true,
                  source: purchase.verificationData.source,
                );
                _pendingPurchase = purchase;
                _billingStoreBloc.add(CreateBillStoreEvent(body: createBody));
              }
            }
          } catch (e) {
            // Lỗi xảy ra trước khi kịp dispatch event nào tới bloc -> mở khóa
            // lại key này ngay, để tránh chặn oan lần thử lại kế tiếp của
            // cùng giao dịch (vì flow verifyAppleReceiptFailure/failure sẽ
            // không được kích hoạt trong trường hợp này).
            _inflightPurchaseIds.remove(purchaseKey);
            setState(() {
              debugPrint('Lỗi chuẩn bị dữ liệu xác thực: $e');
              _isPurchasing = false;
            });
          }

          break;
        case PurchaseStatus.error:
          if (!mounted) return;
          FirebaseAnalyticsHelper.logEvent(
            name: 'purchase_failed',
            parameters: {
              'product_id': purchase.productID,
              'error': purchase.error?.message ?? 'Unknown error',
            },
          );
          FirebasePerformanceHelper.stopTrace('in_app_purchase_flow');
          setState(() {
            _statusMessage =
                'Thanh toán lỗi: ${purchase.error?.message ?? 'Unknown error'}';
            _isPurchasing = false;
          });
          if (_pendingPurchase?.status == PurchaseStatus.pending) {
            _pendingErrorTimer?.cancel();
            _billingStoreBloc.add(
              UpdateBillStoreEvent(
                body: BillingStoreUpdateStatusBody(
                  isRestore: false,
                  purchaseId: purchase.purchaseID ?? '',
                  status: purchase.status.name,
                  purchaseToken:
                      purchase.verificationData.serverVerificationData,
                ),
              ),
            );
          }
          break;
        case PurchaseStatus.canceled:
          if (!mounted) return;
          FirebaseAnalyticsHelper.logEvent(
            name: 'purchase_canceled',
            parameters: {'product_id': purchase.productID},
          );
          FirebasePerformanceHelper.stopTrace('in_app_purchase_flow');
          setState(() {
            debugPrint('Bạn đã hủy thanh toán.');
            _isPurchasing = false;
          });
          if (purchase.pendingCompletePurchase) {
            await _safeCompletePurchase(purchase, context: 'status_canceled');
          }
          break;
      }
    }
  }

  void _showUseNowModal() {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text('Thanh toán thành công'),
          content: const Text('Cảm ơn bạn đã nâng cấp dịch vụ!'),
          actions: <Widget>[
            FilledButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Đóng'),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _billingStoreBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.orderCreditsStore),
          bottom: kDebugMode && _statusMessage.isNotEmpty
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(20),
                  child: Text(
                    _statusMessage,
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                )
              : null,
        ),
        body: BlocConsumer<BillingStoreBloc, BillingStoreState>(
          listener: (context, state) async {
            if (state.status ==
                BillingStoreStateStatus.hasPendingPurchaseCache) {
              if (state.data is PendingPurchaseCache) {
                _pendingPurchaseCacheData = state.data as PendingPurchaseCache;
              }
              setState(() {
                _statusMessage =
                    'Có giao dịch purchased/restored trong cache. Nhấn vào card để cập nhật lại trạng thái.';
              });
            }
            // 1. Lấy danh sách sản phẩm từ DB
            else if (state.status == BillingStoreStateStatus.gotProductList) {
              final List<StoreItem> data = state.data;
              _billingStoreBloc.add(
                GetBillingProductDetailsEvent(
                  productIds: data.map((e) => e.id ?? '').toSet(),
                ),
              );
            }
            // 2. Verify Apple Receipt thành công -> Tạo bill trên server TRƯỚC
            // (giống pattern Android: insert rồi mới update), dùng _pendingCreateBody
            // đã được lưu sẵn lúc dispatch VerifyAppleReceiptEvent thay vì phụ
            // thuộc kiểu dữ liệu bloc trả về trong state.data.
            else if (state.status ==
                BillingStoreStateStatus.verifyAppleReceiptSuccess) {
              final AppleTransactionEntity data = state.data;
              if (_pendingCreateBody != null) {
                // Cache lại cục bộ NGAY SAU KHI verify Apple thành công, đánh
                // dấu rõ mốc "đã verify, chỉ còn thiếu bước tạo bill trên
                // server". Nếu app bị kill ngay sau bước này (trước khi
                // createBillingStore/updateBillingStore hoàn tất), lần mở
                // app kế tiếp sẽ đọc lại được cache này thay vì mất trắng
                // giao dịch đã verify với Apple.
                await _cachePendingCreateBodyToHive(
                  _pendingCreateBody?.copyWith(
                        purchaseToken: data.transactionId,
                        source: 'app_store',
                      ) ??
                      _pendingCreateBody!,
                );

                _billingStoreBloc.add(
                  CreateBillStoreEvent(
                    body:
                        _pendingCreateBody?.copyWith(
                          purchaseToken: data.transactionId,
                          source: 'app_store',
                        ) ??
                        _pendingCreateBody!,
                  ),
                );
              } else {
                // Không nên xảy ra trong flow bình thường, nhưng phòng hờ:
                // nếu vì lý do gì đó không có createBody sẵn, báo lỗi thay vì
                // im lặng bỏ qua bước tạo bill.
                setState(() {
                  _statusMessage =
                      'Lỗi: thiếu dữ liệu để tạo bill sau khi verify Apple.';
                  _isPurchasing = false;
                });
              }
            }
            // 3. Lấy chi tiết sản phẩm từ Store (Google Play / App Store)
            else if (state.status == BillingStoreStateStatus.gotProductDetail) {
              final List<ProductDetails> data = state.data;
              BillingPage.vProducts.setValue(data);
              final hasValidSelection = data.any(
                (p) => p.id == _selectedProductId,
              );
              setState(() {
                debugPrint('Chọn gói lượt tạo đơn để thanh toán:');
                if (!hasValidSelection) {
                  _selectedProductId = data.isNotEmpty ? data.first.id : null;
                }
              });
            }
            // 4. Tạo bill trên server thành công -> Complete purchase và cập nhật trạng thái hoàn tất
            else if (state.status ==
                BillingStoreStateStatus.createBillingStore) {
              final BillingStore data = state.data;
              if (_pendingPurchase?.status != PurchaseStatus.pending) {
                setState(() {
                  debugPrint('Xác thực thanh toán thành công!');
                  _isPurchasing = false;
                });
                if (_pendingPurchaseCacheData?.purchaseId?.isNotEmpty ??
                    false) {
                  _billingStoreBloc.add(
                    UpdateBillStoreEvent(
                      body: BillingStoreUpdateStatusBody(
                        isRestore: false,
                        purchaseId: _pendingPurchaseCacheData?.purchaseId,
                        status: 'completed',
                        purchaseToken: data.purchaseToken,
                      ),
                    ),
                  );
                } else {
                  _billingStoreBloc.add(
                    UpdateBillStoreEvent(
                      body: BillingStoreUpdateStatusBody(
                        isRestore: false,
                        purchaseId: _pendingPurchase?.purchaseID ?? '',
                        status: 'completed',
                        purchaseToken: data.purchaseToken,
                      ),
                    ),
                  );
                }
              } else {
                _pendingErrorTimer?.cancel();
                _pendingErrorTimer = Timer(const Duration(seconds: 45), () {
                  // todo show scaf
                  setState(() {
                    debugPrint('');
                    _isPurchasing = false;
                  });
                  AppSnackBar.showError(
                    context,
                    message: context.l10n.purchaseFailed,
                  );
                  _pendingErrorTimer = null;
                });
              }
            }
            // 5. Xử lý LỖI (Verify Apple Receipt thất bại HOẶC Tạo bill thất bại)
            else if (state.status ==
                    BillingStoreStateStatus.verifyAppleReceiptFailure ||
                state.status == BillingStoreStateStatus.failure) {
              setState(() {
                debugPrint('Lỗi xử lý xác thực: ${state.data}');
                _isPurchasing = false;
              });

              AppSnackBar.showError(
                context,
                message: context.l10n.verificationError(state.data.toString()),
              );

              if (_pendingPurchase != null &&
                  _pendingPurchase!.pendingCompletePurchase) {
                await _safeCompletePurchase(
                  _pendingPurchase,
                  context: 'verify_or_create_failure',
                );
                debugPrint(
                  'Đã complete giao dịch lỗi để giải phóng queue của StoreKit.',
                );
              }

              // Flow verify/create đã kết thúc (dù là lỗi) -> mở khóa lại key
              // trong _inflightPurchaseIds, để nếu người dùng thử mua lại
              // giao dịch với cùng purchaseID/productID thì không bị guard
              // ở _listenToPurchaseUpdates chặn oan.
              final String? failedKey =
                  _pendingPurchase?.purchaseID ?? _pendingPurchase?.productID;
              if (failedKey != null) {
                _inflightPurchaseIds.remove(failedKey);
              }

              _pendingCreateBody = null;
            }
            // 6. Cập nhật trạng thái bill hoàn tất
            else if (state.status ==
                BillingStoreStateStatus.updateBillingStore) {
              final BillingStore data = state.data;
                 updateId = data.id ?? '';
              
              FirebasePerformanceHelper.stopTrace('in_app_purchase_flow');
              FirebaseAnalyticsHelper.logEvent(
                name: 'purchase_success',
                parameters: {
                  'product_id':
                      _pendingPurchase?.productID ??
                      _pendingPurchaseCacheData?.productId ??
                      '',
                  'purchase_id':
                      _pendingPurchase?.purchaseID ??
                      _pendingPurchaseCacheData?.purchaseId ??
                      '',
                },
              );
              // Flow hoàn tất, dọn createBody tạm đã lưu cho lượt verify vừa rồi.
              _pendingCreateBody = null;

              if (_pendingPurchase == null) {
                if (!mounted) return;
                setState(() {
                  _statusMessage =
                      'Đã cập nhật giao dịch pending từ cache thành công.';
                  _isPurchasing = false;
                });
                await _cleanCachedPurchaseFromHive();
                _billingStoreBloc.add(const GetStoreItemEvent());
                if (updateId.isNotEmpty) {
                  _showUseNowModal();
                }
                return;
              }
              final String successKey =
                  _pendingPurchase!.purchaseID ?? _pendingPurchase!.productID;
              _inflightPurchaseIds.remove(successKey);

              await _safeCompletePurchase(
                _pendingPurchase,
                context: 'update_billing_store',
              );
              _pendingPurchase = null;
              debugPrint('Hoàn thành cập nhật billing store');
              if (!mounted) return;

              setState(() {
                debugPrint('Cập nhật lượt tạo đơn thành công!');
                _isPurchasing = false;
              });

              await _cleanCachedPurchaseFromHive();
              if (updateId.isNotEmpty) {
                _showUseNowModal();
              }
            }
          },
          builder: (context, state) {
            if (state.status ==
                BillingStoreStateStatus.hasPendingPurchaseCache) {
              // Giao dịch pending trong cache là 1 mục cần hoàn tất riêng,
              // không phải 1 lựa chọn trong danh sách gói -> vẫn giữ nút bấm
              // hành động riêng của chính nó, không đi qua radio selection.
              return ListView(
                padding: const EdgeInsets.all(16),
                children: <Widget>[
                  _PendingPurchaseCard(
                    productId: _pendingPurchaseCacheData?.productId ?? '',
                    description: _pendingPurchaseCacheData?.description ?? '',
                    price: _pendingPurchaseCacheData?.price ?? '',
                    isPurchasing: _isPurchasing,
                    onBuy: _onTapPendingPurchaseCard,
                  ),
                ],
              );
            }
            if (state.status == BillingStoreStateStatus.loading) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return ValueListenableBuilder(
              valueListenable: BillingPage.vProducts,
              builder: (context, productList, child) {
                final selectedProduct = _findSelectedProduct(productList);

                return Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.all(16),
                        itemCount: productList.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final product = productList[index];
                          return _StoreProductCard(
                            product: product,
                            selected: product.id == _selectedProductId,
                            onSelect: (id) =>
                                setState(() => _selectedProductId = id),
                          );
                        },
                      ),
                    ),
                    SafeArea(
                      top: false,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: BillingPrimaryButton(
                          isLoading: _isPurchasing,
                          onPressed:
                              (!_isPurchasing && selectedProduct != null)
                              ? () => _buyProduct(selectedProduct)
                              : null,
                          child: _isPurchasing
                              ? const SizedBox(
                                  key: ValueKey('main-loading'),
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2.5,
                                  ),
                                )
                              : Row(
                                  key: const ValueKey('main-buy'),
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.shopping_cart_checkout_outlined,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      selectedProduct != null
                                          ? context.l10n.buyPackageWithPrice(
                                              selectedProduct.price,
                                            )
                                          : context.l10n.selectOrderPackage,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

// Card hiển thị 1 sản phẩm trong danh sách để CHỌN (radio), không còn nút mua
// riêng. Cả card đều bấm được để chọn, việc mua được chốt lại ở 1 nút chung
// bên dưới danh sách (xem _BillingPageState.build).
class _StoreProductCard extends StatelessWidget {
  final ProductDetails product;
  final bool selected;
  final ValueChanged<String> onSelect;

  const _StoreProductCard({
    required this.product,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return BillingCardShell(
      selected: selected,
      onTap: () => onSelect(product.id),
      badge: selected
          ? const BillingCardBadge(
              text: 'ĐANG CHỌN',
              color: Color(0xFF00B894),
            )
          : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BillingCardHeader(
            title: product.title.split('(').first,
            selected: selected,
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          if (product.description.isNotEmpty) ...[
            BillingBenefitRow(
              icon: Icons.info_outline_rounded,
              text: product.description,
            ),
            const SizedBox(height: 10),
          ],
          BillingPricePill(price: product.price),
        ],
      ),
    );
  }
}

// Card riêng cho giao dịch pending đọc từ cache: đây là 1 hành động cần hoàn
// tất ngay (resume giao dịch dở dang), không phải 1 lựa chọn trong danh sách
// nên vẫn giữ nút bấm hành động của riêng nó thay vì đi qua radio selection.
class _PendingPurchaseCard extends StatelessWidget {
  final String productId;
  final String description;
  final String price;
  final bool isPurchasing;
  final VoidCallback onBuy;

  const _PendingPurchaseCard({
    required this.productId,
    required this.description,
    required this.price,
    required this.isPurchasing,
    required this.onBuy,
  });

  @override
  Widget build(BuildContext context) {
    return BillingCardShell(
      selected: true,
      badge: BillingCardBadge(text: context.l10n.pendingPurchaseBadge.toUpperCase()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.pendingPurchaseTitle,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          BillingInfoRow(label: context.l10n.productId, value: productId),
          if (description.isNotEmpty)
            BillingInfoRow(
              label: context.l10n.description,
              value: description,
            ),
          BillingInfoRow(label: context.l10n.price, value: price),
          const SizedBox(height: 16),
          BillingPrimaryButton(
            isLoading: isPurchasing,
            onPressed: isPurchasing ? null : onBuy,
            child: isPurchasing
                ? const SizedBox(
                    key: ValueKey('pending-loading'),
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2.5,
                    ),
                  )
                : Row(
                    key: ValueKey('pending-buy'),
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.shopping_cart_checkout_outlined),
                      const SizedBox(width: 8),
                      Text(
                        context.l10n.completePendingTransaction,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}