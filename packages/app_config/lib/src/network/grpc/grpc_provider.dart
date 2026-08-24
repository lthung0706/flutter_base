import 'dart:async';

import 'package:grpc/grpc.dart';

import '../interceptors/grpc_header_interceptior.dart';
import '../log/log.dart';

enum ConnectionStatus {
  connecting,
  connected,
  reconnecting,
  disconnected,
  paused,
  offline,
}

class GrpcProvider {
  final String baseUrl;
  final bool enableLogger;
  final bool enableOnlineLogger;

  late final ClientChannel _channel;
  final AuthInterceptor? authInterceptor;

  ClientChannel get channel => _channel;

  GrpcProvider({
    required this.baseUrl,
    required this.enableLogger,
    this.enableOnlineLogger = false,
    this.authInterceptor,
  }) {
    // Parse URL to extract host and port
    final uri = Uri.parse(baseUrl);
    final host = uri.host;
    final port = uri.hasPort ? uri.port : (uri.scheme == 'https' ? 443 : 8080);

    final credentials = uri.scheme == 'https'
        ? const ChannelCredentials.secure()
        : const ChannelCredentials.insecure();

    if (enableLogger) {
      Log.info(
        '🔌 gRPC channel created for: $host:$port (lazy connect enabled)',
      );
    }

    _channel = ClientChannel(
      host,
      port: port,
      options: ChannelOptions(
        connectionTimeout: const Duration(seconds: 30),
        idleTimeout: const Duration(hours: 4),
        credentials: credentials,
        // Keepalive configuration to detect dead connections faster
        keepAlive: const ClientKeepAliveOptions(
          pingInterval: Duration(seconds: 30),
          timeout: Duration(seconds: 10),
          permitWithoutCalls: true,
        ),
      ),
    );
  }

  void init() {
    _channel.onConnectionStateChanged.listen((state) {
      if (enableLogger) {
        switch (state) {
          case ConnectionState.ready:
            Log.info('✅ gRPC connected');
          case ConnectionState.idle:
            Log.info('💤 gRPC idle (no active calls)');
          case ConnectionState.connecting:
            Log.info('🔄 gRPC connecting...');
          case ConnectionState.transientFailure:
            Log.info('⚠️ gRPC connection lost, auto-reconnecting...');
          case ConnectionState.shutdown:
            Log.info('🛑 gRPC connection shutdown');
        }
      }
    });
  }

  bool _isDisconnecting = false;

  /// Shutdown gRPC channel and close all connections
  Future<void> disconnect() async {
    if (_isDisconnecting) return;
    _isDisconnecting = true;
    try {
      if (enableLogger) {
        Log.info('🔌 Shutting down gRPC channel...');
      }
      await _channel.shutdown();
    } catch (e) {
      if (enableLogger) {
        Log.error('❌ Error shutting down gRPC channel: $e');
      }
    } finally {
      _isDisconnecting = false;
    }
  }

  T createClient<T>(
    T Function(ClientChannel channel, {List<ClientInterceptor>? interceptors})
    factory,
  ) {
    return factory(
      _channel,
      interceptors: authInterceptor != null ? [authInterceptor!] : null,
    );
  }
}
