// Package imports:
import 'dart:async';

import 'package:app_config/app_config.dart';

// Project imports:
import 'socket_provider.dart';

class SocketNetwork {
  factory SocketNetwork({
    required final bool enableLogger,
    final bool enableOnlineLogger = false,
    required Map<String, dynamic> getChatHeadersProvider,
    required Map<String, StreamController<Map<String, dynamic>?>>
    eventControllers,
  }) {
    return SocketNetwork._init(
      enableLogger: enableLogger,
      enableOnlineLogger: enableOnlineLogger,
      getChatHeadersProvider: getChatHeadersProvider,
      eventControllers: eventControllers,
    );
  }

  SocketNetwork._init({
    required this.enableLogger,
    this.enableOnlineLogger = false,
    required this.getChatHeadersProvider,
    required this.eventControllers,
  }) {
    socketProvider = SocketProvider(
      eventControllers: eventControllers,
      baseUrl: AppConfig.chatUrl,
      enableLogger: enableLogger,
      enableOnlineLogger: enableOnlineLogger,
      getHeaders: getChatHeadersProvider,
    );
  }

  final bool enableLogger;
  final bool enableOnlineLogger;
  late SocketProvider socketProvider;
  final Map<String, dynamic> getChatHeadersProvider;
  final Map<String, StreamController<Map<String, dynamic>?>> eventControllers;
}
