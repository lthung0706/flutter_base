// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api_service.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main,avoid_redundant_argument_values

class _AuthApiService implements AuthApiService {
  _AuthApiService(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<HttpResponse<GenericResponseModel<AuthenRegisterModel>?>> register(
    RegisterBodyParams body, {
    bool? isMockUp,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'isMockUp': isMockUp};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _options =
        _setStreamType<
          HttpResponse<GenericResponseModel<AuthenRegisterModel>?>
        >(
          Options(method: 'POST', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                '/api/v1/auth/register',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>?>(_options);
    late GenericResponseModel<AuthenRegisterModel>? _value;
    try {
      _value = _result.data == null
          ? null
          : GenericResponseModel<AuthenRegisterModel>.fromJson(
              _result.data!,
              (json) =>
                  AuthenRegisterModel.fromJson(json as Map<String, dynamic>),
            );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<GenericResponseModel<AuthDataModel>?>> login(
    LoginRequestBody body, {
    bool? isMockUp,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'isMockUp': isMockUp};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _options =
        _setStreamType<HttpResponse<GenericResponseModel<AuthDataModel>?>>(
          Options(method: 'POST', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                '/api/v1/auth/login',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>?>(_options);
    late GenericResponseModel<AuthDataModel>? _value;
    try {
      _value = _result.data == null
          ? null
          : GenericResponseModel<AuthDataModel>.fromJson(
              _result.data!,
              (json) => AuthDataModel.fromJson(json as Map<String, dynamic>),
            );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<GenericResponseModel<AuthDataModel>?>> googleLogin(
    GoogleLoginRequestBody body, {
    bool? isMockUp,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'isMockUp': isMockUp};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _options =
        _setStreamType<HttpResponse<GenericResponseModel<AuthDataModel>?>>(
          Options(method: 'POST', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                '/api/v1/auth/google-login',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>?>(_options);
    late GenericResponseModel<AuthDataModel>? _value;
    try {
      _value = _result.data == null
          ? null
          : GenericResponseModel<AuthDataModel>.fromJson(
              _result.data!,
              (json) => AuthDataModel.fromJson(json as Map<String, dynamic>),
            );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<GenericResponseModel<AuthDataModel>?>> appleLogin(
    AppleLoginRequestBody body, {
    bool? isMockUp,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'isMockUp': isMockUp};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _options =
        _setStreamType<HttpResponse<GenericResponseModel<AuthDataModel>?>>(
          Options(method: 'POST', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                '/api/v1/auth/apple-login',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>?>(_options);
    late GenericResponseModel<AuthDataModel>? _value;
    try {
      _value = _result.data == null
          ? null
          : GenericResponseModel<AuthDataModel>.fromJson(
              _result.data!,
              (json) => AuthDataModel.fromJson(json as Map<String, dynamic>),
            );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<GenericResponseModel<bool>?>> addUser(
    AddUserRequestBody body, {
    bool? isMockUp,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'isMockUp': isMockUp};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _options = _setStreamType<HttpResponse<GenericResponseModel<bool>?>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v1/auth/register-manager',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>?>(_options);
    late GenericResponseModel<bool>? _value;
    try {
      _value = _result.data == null
          ? null
          : GenericResponseModel<bool>.fromJson(
              _result.data!,
              (json) => json as bool,
            );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<GenericResponseModel<List<UserUpdatedModel>>?>>
  updateInfoUser(UserRequestBody body, {bool? isMockUp}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'isMockUp': isMockUp};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _options =
        _setStreamType<
          HttpResponse<GenericResponseModel<List<UserUpdatedModel>>?>
        >(
          Options(method: 'POST', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                '/api/v1/managers/update-info-user',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>?>(_options);
    late GenericResponseModel<List<UserUpdatedModel>>? _value;
    try {
      _value = _result.data == null
          ? null
          : GenericResponseModel<List<UserUpdatedModel>>.fromJson(
              _result.data!,
              (json) => json is List<dynamic>
                  ? json
                        .map<UserUpdatedModel>(
                          (i) => UserUpdatedModel.fromJson(
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
  Future<HttpResponse<GenericResponseModel<AuthDataModel>?>> refreshToken(
    RefreshTokenRequestBody body, {
    bool? isMockUp,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'isMockUp': isMockUp};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _options =
        _setStreamType<HttpResponse<GenericResponseModel<AuthDataModel>?>>(
          Options(method: 'POST', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                '/api/v1/auth/refresh-token',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>?>(_options);
    late GenericResponseModel<AuthDataModel>? _value;
    try {
      _value = _result.data == null
          ? null
          : GenericResponseModel<AuthDataModel>.fromJson(
              _result.data!,
              (json) => AuthDataModel.fromJson(json as Map<String, dynamic>),
            );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<GenericResponseModel<bool>?>> logout({
    bool? isMockUp,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'isMockUp': isMockUp};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<HttpResponse<GenericResponseModel<bool>?>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v1/auth/logout',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>?>(_options);
    late GenericResponseModel<bool>? _value;
    try {
      _value = _result.data == null
          ? null
          : GenericResponseModel<bool>.fromJson(
              _result.data!,
              (json) => json as bool,
            );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<GenericResponseModel<AuthDataModel>?>> getOtp({
    bool? isMockUp,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'isMockUp': isMockUp};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<HttpResponse<GenericResponseModel<AuthDataModel>?>>(
          Options(method: 'POST', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                '/api/v1/auth/otp',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>?>(_options);
    late GenericResponseModel<AuthDataModel>? _value;
    try {
      _value = _result.data == null
          ? null
          : GenericResponseModel<AuthDataModel>.fromJson(
              _result.data!,
              (json) => AuthDataModel.fromJson(json as Map<String, dynamic>),
            );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<GenericResponseModel<AuthDataModel>?>> resetPassword({
    bool? isMockUp,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'isMockUp': isMockUp};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<HttpResponse<GenericResponseModel<AuthDataModel>?>>(
          Options(method: 'POST', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                '/api/v1/auth/reset-password',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>?>(_options);
    late GenericResponseModel<AuthDataModel>? _value;
    try {
      _value = _result.data == null
          ? null
          : GenericResponseModel<AuthDataModel>.fromJson(
              _result.data!,
              (json) => AuthDataModel.fromJson(json as Map<String, dynamic>),
            );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<GenericResponseModel<bool>?>> deleteUser({
    required String userId,
    bool? isMockUp,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'isMockUp': isMockUp};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<HttpResponse<GenericResponseModel<bool>?>>(
      Options(method: 'DELETE', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v1/auth/delete-account/${userId}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>?>(_options);
    late GenericResponseModel<bool>? _value;
    try {
      _value = _result.data == null
          ? null
          : GenericResponseModel<bool>.fromJson(
              _result.data!,
              (json) => json as bool,
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
