// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:app_config/app_config.dart';
import 'package:web_socket_client/web_socket_client.dart';

// Project imports:
import 'socket_message.dart';

class SocketProvider {
  SocketProvider({
    required this.baseUrl,
    required this.enableLogger,
    this.enableOnlineLogger = false,
    required this.getHeaders,
    required this.eventControllers,
  }) {
    //  _initializeWebSocket();

    if (enableLogger) {
      _setupLogging();
    }
  }

  final String baseUrl;
  final bool enableLogger;
  final bool enableOnlineLogger;
  Map<String, dynamic> getHeaders;

  late WebSocket _webSocket;
  final Map<String, StreamController<Map<String, dynamic>?>> eventControllers;
  final Map<String, Completer<Map<String, dynamic>?>> _ackCompleters = {};
  int _messageId = 0;
  bool _isConnected = false;

  void _initializeWebSocket() {
    final uri = Uri.parse(baseUrl.replaceFirst('http', 'ws'));
    _webSocket = WebSocket(
      uri,
      timeout: const Duration(seconds: 20),
      headers: getHeaders,
    );

    _webSocket.connection.listen(
      (state) {
        switch (state) {
          case Connected():
            _isConnected = true;
            if (enableLogger) Log.info('Socket connected');
            break;
          case Disconnected():
            _isConnected = false;
            if (enableLogger) Log.info('Socket disconnected');
            break;
          case Connecting():
            if (enableLogger) Log.info('Socket connecting...');
            break;
          case Disconnecting():
            if (enableLogger) Log.info('Socket disconnecting...');
            break;
          default:
            //   _isConnected = true;
            if (enableLogger) Log.info('Socket reconnected');
            break;
        }
      },
      onError: (error) {
        if (enableLogger) Log.error('Socket connection error: $error');
      },
    );

    _webSocket.messages.listen(
      (message) {
        try {
          final Map<String, dynamic> data = jsonDecode(message);
          _handleMessage(data);
        } catch (e) {
          if (enableLogger) Log.error('Failed to parse message: $e');
        }
      },
      onError: (error) {
        if (enableLogger) Log.error('Socket message error: $error');
      },
    );
  }

  void _handleMessage(final Map<String, dynamic> data) {
    final message = SocketMessage.fromJson(data);

    // if (message.isAck && message.id != null) {
    //   final completer = _ackCompleters.remove(message.id);
    //   completer?.complete(message.data as Map<String, dynamic>?);
    // } else
    if (message.event != null) {
      //   final controller = eventControllers[message.event];
      if (eventControllers[message.event] != null &&
          !(eventControllers[message.event]?.isClosed ?? false)) {
        eventControllers[message.event]?.add(message.data);
      }

      // Handle welcome event specifically
      // if (message.event == 'welcome' && enableLogger) {
      //   print('welcome: ${message.data}');
      // }
      // mapStream[message.event]?.add(message.data);
    }
  }

  void _setupLogging() {
    // Logging is handled in _initializeWebSocket
  }

  bool get connected => _isConnected;

  void disconnect() {
    _webSocket.close();
    _isConnected = false;

    // Clean up controllers and completers
    for (final controller in eventControllers.values) {
      if (!controller.isClosed) {
        controller.close();
      }
    }
    eventControllers.clear();

    for (final completer in _ackCompleters.values) {
      if (!completer.isCompleted) {
        completer.completeError('Socket disconnected');
      }
    }
    _ackCompleters.clear();
  }

  Future<Map<String, dynamic>?> emit(
    final String event, {
    final dynamic data,
    final bool acknowledgment = false,
    final bool isMockup = false,
  }) async {
    if (isMockup) {
      return MockApi.get(event, queryParameters: data);
    }

    try {
      Log.info('📤 Emitting event: $event with data: $data');

      final messageId = (++_messageId).toString();
      final message = SocketMessage(
        event: event,
        data: data,
        id: messageId,
        isAck: acknowledgment,
      );

      if (acknowledgment) {
        final completer = Completer<Map<String, dynamic>?>();
        _ackCompleters[messageId] = completer;

        _webSocket.send(jsonEncode(message.toJson()));

        // Set timeout for acknowledgment
        Timer(const Duration(seconds: 30), () {
          if (!completer.isCompleted) {
            _ackCompleters.remove(messageId);
            completer.completeError('Acknowledgment timeout');
          }
        });

        final response = await completer.future;
        Log.info('📥 Received ack: $response');
        return response;
      } else {
        _webSocket.send(jsonEncode(message.toJson()));
        return <String, dynamic>{'success': true};
      }
    } catch (e) {
      Log.error('Socket emit error: $e');
      return <String, dynamic>{
        'error_code': -1,
        'error_message': 'Socket connection error',
        'message': 'Socket connection error',
      };
    }
  }

  Stream<Map<String, dynamic>?> listen(
    final String event, {
    final bool isMockup = false,
  }) {
    if (isMockup) {
      return Stream.fromFuture(MockApi.get(event, queryParameters: null));
    }

    if (!eventControllers.containsKey(event)) {
      eventControllers[event] =
          StreamController<Map<String, dynamic>?>.broadcast();
    }

    if (!_isConnected) {
      _initializeWebSocket();
    }

    return eventControllers[event]?.stream ?? const Stream.empty();
  }

  // ignore: unused_element
  Future<void> _waitForConnection() async {
    final completer = Completer<void>();
    if (_isConnected) {
      completer.complete();
    } else {
      late StreamSubscription subscription;
      subscription = _webSocket.connection.listen((state) {
        if (state is Connected) {
          subscription.cancel();
          completer.complete();
        }
      });
    }
    return completer.future;
  }
}
