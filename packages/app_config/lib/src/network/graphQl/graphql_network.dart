// Project imports:
import 'graphql_provider.dart';

class GraphQLNetwork {
  factory GraphQLNetwork({
    required final bool enableLogger,
    required final String baseUrl,
    required final Future<Map<String, dynamic>> Function() getHeaders,
    final bool enableOnlineLogger = false,
    final String? websocketEndpoint,
    final String endpointPath = '',
  }) {
    return GraphQLNetwork._init(
      enableLogger: enableLogger,
      enableOnlineLogger: enableOnlineLogger,
      baseUrl: baseUrl,
      getHeaders: getHeaders,
      websocketEndpoint: websocketEndpoint,
      endpointPath: endpointPath,
    );
  }

  GraphQLNetwork._init({
    required this.enableLogger,
    required this.enableOnlineLogger,
    required this.baseUrl,
    required this.getHeaders,
    required this.websocketEndpoint,
    required this.endpointPath,
  }) {
    graphQLProvider = GraphQLProvider(
      baseUrl: baseUrl,
      enableLogger: enableLogger,
      enableOnlineLogger: enableOnlineLogger,
      getHeaders: getHeaders,
      websocketEndpoint: websocketEndpoint,
      endpointPath: endpointPath,
    );
  }

  final bool enableLogger;
  final bool enableOnlineLogger;
  final String baseUrl;
  final Future<Map<String, dynamic>> Function() getHeaders;
  final String? websocketEndpoint;
  final String endpointPath;

  late GraphQLProvider graphQLProvider;
}
