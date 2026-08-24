// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billing_product_api_service.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main,avoid_redundant_argument_values

class _BillingProductApiService implements BillingProductApiService {
  _BillingProductApiService(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<HttpResponse<GenericResponseModel<List<StoreItemModel>>?>>
  getBillingProductList({bool? isMockUp}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'isMockUp': isMockUp};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<
          HttpResponse<GenericResponseModel<List<StoreItemModel>>?>
        >(
          Options(method: 'GET', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                '/api/v1/billing_store/store-items',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>?>(_options);
    late GenericResponseModel<List<StoreItemModel>>? _value;
    try {
      _value = _result.data == null
          ? null
          : GenericResponseModel<List<StoreItemModel>>.fromJson(
              _result.data!,
              (json) => json is List<dynamic>
                  ? json
                        .map<StoreItemModel>(
                          (i) => StoreItemModel.fromJson(
                            i as Map<String, dynamic>,
                          ),
                        )
                        .toList()
                  : List.empty(),
            );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<GenericResponseModel<BillingStoreModel>?>>
  createBillStore(BillingStoreCreateBody params, {bool? isMockUp}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'isMockUp': isMockUp};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(params.toJson());
    final _options =
        _setStreamType<HttpResponse<GenericResponseModel<BillingStoreModel>?>>(
          Options(method: 'POST', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                '/api/v1/billing_store/create-bill-store',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>?>(_options);
    late GenericResponseModel<BillingStoreModel>? _value;
    try {
      _value = _result.data == null
          ? null
          : GenericResponseModel<BillingStoreModel>.fromJson(
              _result.data!,
              (json) =>
                  BillingStoreModel.fromJson(json as Map<String, dynamic>),
            );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<GenericResponseModel<BillingStoreModel>?>>
  updateBillStore(BillingStoreUpdateStatusBody params, {bool? isMockUp}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'isMockUp': isMockUp};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(params.toJson());
    final _options =
        _setStreamType<HttpResponse<GenericResponseModel<BillingStoreModel>?>>(
          Options(method: 'PUT', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                '/api/v1/billing_store/update-status-bill-store',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>?>(_options);
    late GenericResponseModel<BillingStoreModel>? _value;
    try {
      _value = _result.data == null
          ? null
          : GenericResponseModel<BillingStoreModel>.fromJson(
              _result.data!,
              (json) =>
                  BillingStoreModel.fromJson(json as Map<String, dynamic>),
            );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<GenericResponseModel<AppleTransactionModel>?>>
  verifyAppleReceipt(AppleVerifyReceiptBody params, {bool? isMockUp}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'isMockUp': isMockUp};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(params.toJson());
    final _options =
        _setStreamType<
          HttpResponse<GenericResponseModel<AppleTransactionModel>?>
        >(
          Options(method: 'POST', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                '/api/v1/apple/verify',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>?>(_options);
    late GenericResponseModel<AppleTransactionModel>? _value;
    try {
      _value = _result.data == null
          ? null
          : GenericResponseModel<AppleTransactionModel>.fromJson(
              _result.data!,
              (json) =>
                  AppleTransactionModel.fromJson(json as Map<String, dynamic>),
            );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

// dart format on
