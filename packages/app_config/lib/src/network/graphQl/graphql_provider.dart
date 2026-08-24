// Dart imports:
import 'dart:io';

// Package imports:
import 'package:app_config/src/network/interceptors/header_interceptor.dart';
import 'package:app_config/src/network/log/log.dart';
import 'package:app_config/src/network/mockup/mock_api.dart';
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart' as dio;
import 'package:graphql/client.dart';
import 'package:gql/ast.dart';
import 'package:gql/language.dart';
import 'package:logarte/logarte.dart';

// Project imports:
import '../interceptors/mockup_interceptor.dart';

class GraphQLProvider {
  GraphQLProvider({
    required this.enableLogger,
    this.enableOnlineLogger = false,
    required this.baseUrl,
    required this.getHeaders,
    this.websocketEndpoint,
    this.endpointPath = '',
  }) {
    final dio.BaseOptions dioOptions = dio.BaseOptions()
      ..baseUrl = baseUrl
      ..connectTimeout = const Duration(milliseconds: 20000)
      ..receiveTimeout = const Duration(milliseconds: 30000)
      ..headers = <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      };

    apiDio = dio.Dio(dioOptions);

    //----------------- SET HEADER ------------------//
    apiDio.interceptors.add(HeaderInterceptor(getHeaders));

    //----------------- LOGGING ---------------------//
    if (enableLogger) {
      apiDio.interceptors.add(Log.prettyInterceptor);
      apiDio.interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true));
    }

    //---------------- MOCKUP -------------------//
    if (enableLogger) {
      apiDio.interceptors.add(MockUpInterceptor());
    }

    // ----------------- LOGARTE ---------------------//
    if (enableOnlineLogger) {
      apiDio.interceptors.add(LogarteDioInterceptor(Log.logarte));
    }

    Link link = _DioGraphQLLink(apiDio, endpointPath: endpointPath);

    if (websocketEndpoint != null) {
      final wsLink = WebSocketLink(
        websocketEndpoint!,
        config: SocketClientConfig(initialPayload: () async => getHeaders()),
      );
      link = Link.split((request) => request.isSubscription, wsLink, link);
    }

    client = GraphQLClient(cache: GraphQLCache(), link: link);
  }

  late final dio.Dio apiDio;
  late final GraphQLClient client;

  final bool enableLogger;
  final bool enableOnlineLogger;
  final String baseUrl;
  final String? websocketEndpoint;
  final String endpointPath;
  final Future<Map<String, dynamic>> Function() getHeaders;

  Future<Map<String, dynamic>?> query({
    required final DocumentNode document,
    final Map<String, dynamic> variables = const <String, dynamic>{},
    final String? operationName,
    final FetchPolicy fetchPolicy = FetchPolicy.networkOnly,
    final bool isMockupApi = false,
    final String? mockEndpoint,
  }) async {
    if (isMockupApi) {
      return MockApi.post(
        mockEndpoint ?? operationName ?? 'graphql_query',
        data: <String, dynamic>{'variables': variables},
      );
    }

    final result = await client.query(
      QueryOptions(
        document: document,
        variables: variables,
        operationName: operationName,
        fetchPolicy: fetchPolicy,
      ),
    );

    return _unwrapResult(result);
  }

  Future<Map<String, dynamic>?> mutate({
    required final DocumentNode document,
    final Map<String, dynamic> variables = const <String, dynamic>{},
    final String? operationName,
    final FetchPolicy fetchPolicy = FetchPolicy.networkOnly,
    final bool isMockupApi = false,
    final String? mockEndpoint,
  }) async {
    if (isMockupApi) {
      return MockApi.post(
        mockEndpoint ?? operationName ?? 'graphql_mutation',
        data: <String, dynamic>{'variables': variables},
      );
    }

    final result = await client.mutate(
      MutationOptions(
        document: document,
        variables: variables,
        operationName: operationName,
        fetchPolicy: fetchPolicy,
      ),
    );

    return _unwrapResult(result);
  }

  Stream<Map<String, dynamic>?> subscribe({
    required final DocumentNode document,
    final Map<String, dynamic> variables = const <String, dynamic>{},
    final String? operationName,
  }) {
    if (websocketEndpoint == null) {
      return Stream<Map<String, dynamic>?>.error(
        StateError('websocketEndpoint is not configured for subscriptions'),
      );
    }

    return client
        .subscribe(
          SubscriptionOptions(
            document: document,
            variables: variables,
            operationName: operationName,
          ),
        )
        .map(_unwrapResult);
  }

  Map<String, dynamic>? _unwrapResult(final QueryResult result) {
    if (!result.hasException) {
      return result.data;
    }

    final linkException = result.exception?.linkException;
    if (linkException is NetworkException) {
      final original = linkException.originalException;
      if (original is dio.DioException &&
          original.response?.statusCode == HttpStatus.unauthorized) {
        return <String, dynamic>{
          'error_code': 401,
          'error_message': 'Hết thời gian truy cập, vui lòng đăng nhập lại',
          'message': 'Hết thời gian truy cập, vui lòng đăng nhập lại',
        };
      }
    }

    final gqlErrors = result.exception?.graphqlErrors;
    if (gqlErrors != null && gqlErrors.isNotEmpty) {
      final first = gqlErrors.first;
      final dynamic extCode = first.extensions?['code'];
      final int code = extCode is int
          ? extCode
          : (extCode is String ? int.tryParse(extCode) ?? -1 : -1);
      return <String, dynamic>{
        'error_code': code,
        'error_message': first.message,
        'message': first.message,
      };
    }

    return null;
  }
}

class _DioGraphQLLink extends Link {
  _DioGraphQLLink(this._dio, {required this.endpointPath});

  final dio.Dio _dio;
  final String endpointPath;

  @override
  Stream<Response> request(
    final Request request, [
    final NextLink? forward,
  ]) async* {
    try {
      final String query = printNode(request.operation.document);
      final String? operationName = request.operation.operationName;

      final Map<String, dynamic> payload = <String, dynamic>{
        'query': query,
        'variables': request.variables,
        ...?(operationName == null
            ? null
            : <String, dynamic>{'operationName': operationName}),
      };

      final dioResponse = await _dio.post<dynamic>(endpointPath, data: payload);

      final raw = dioResponse.data;
      if (raw is! Map<String, dynamic>) {
        yield Response(
          response: <String, dynamic>{'data': raw},
          data: null,
          errors: <GraphQLError>[GraphQLError(message: 'Unexpected response')],
        );
        return;
      }

      final Object? dataRaw = raw['data'];
      final Map<String, dynamic>? data = dataRaw is Map
          ? dataRaw.cast<String, dynamic>()
          : null;

      yield Response(
        response: raw,
        data: data,
        errors: _parseErrors(raw['errors']),
      );
    } on dio.DioException catch (e, st) {
      final uri = Uri.tryParse(_dio.options.baseUrl);
      throw NetworkException.fromException(
        originalException: e,
        originalStackTrace: st,
        uri: uri,
        message: e.message,
      );
    } catch (e, st) {
      final uri = Uri.tryParse(_dio.options.baseUrl);
      throw NetworkException.fromException(
        originalException: e,
        originalStackTrace: st,
        uri: uri,
      );
    }
  }

  List<GraphQLError>? _parseErrors(final Object? rawErrors) {
    if (rawErrors is! List) return null;
    final errors = <GraphQLError>[];

    for (final item in rawErrors) {
      if (item is Map) {
        final String message = item['message']?.toString() ?? 'GraphQL Error';
        final Object? extRaw = item['extensions'];
        final Map<String, dynamic>? extensions = extRaw is Map
            ? extRaw.cast<String, dynamic>()
            : null;
        final Object? locationsRaw = item['locations'];
        final List<ErrorLocation>? locations = locationsRaw is List
            ? locationsRaw
                  .whereType<Map>()
                  .map(
                    (m) => ErrorLocation(
                      line: (m['line'] as num?)?.toInt() ?? 0,
                      column: (m['column'] as num?)?.toInt() ?? 0,
                    ),
                  )
                  .toList()
            : null;
        errors.add(
          GraphQLError(
            message: message,
            locations: locations,
            path: item['path'] as List?,
            extensions: extensions,
          ),
        );
      } else {
        errors.add(GraphQLError(message: item.toString()));
      }
    }

    return errors;
  }
}
