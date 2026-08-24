// Package imports:
import 'package:app_config/app_config.dart';

class GrpcNetwork {
  factory GrpcNetwork({
    required final bool enableLogger,
    final bool enableOnlineLogger = false,
    required Map<String, dynamic> headersProvider,
  }) {
    return GrpcNetwork._init(
      enableLogger: enableLogger,
      enableOnlineLogger: enableOnlineLogger,
      headersProvider: headersProvider,
    );
  }

  GrpcNetwork._init({
    required this.enableLogger,
    this.enableOnlineLogger = false,
    required this.headersProvider,
  }) {
    grpcProvider = GrpcProvider(
      baseUrl: AppConfig.grpcUrl,
      enableLogger: enableLogger,
      enableOnlineLogger: enableOnlineLogger,
    );
  }

  final bool enableLogger;
  final bool enableOnlineLogger;
  late GrpcProvider grpcProvider;
  final Map<String, dynamic> headersProvider;
}
