// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SocketEmitParams {
  SocketEmitParams(
    this.event, {
    this.data,
    this.headers,
    this.acknowledgment,
    this.timeout,
    this.isMockup = false,
  });

  final String event;
  final dynamic data;
  final Map<String, dynamic>? headers;
  final bool? acknowledgment;
  final Duration? timeout;
  final bool isMockup;

  SocketEmitParams copyWith({
    final String? event,
    final dynamic data,
    Map<String, dynamic>? headers,
    bool? acknowledgment,
    Duration? timeout,
    bool? isMockup,
  }) {
    return SocketEmitParams(
      event ?? this.event,
      data: data ?? this.data,
      headers: headers ?? this.headers,
      acknowledgment: acknowledgment ?? this.acknowledgment,
      timeout: timeout ?? this.timeout,
      isMockup: isMockup ?? this.isMockup,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'event': event,
      'data': data,
      'headers': headers,
      'acknowledgment': acknowledgment,
      'isMockup': isMockup,
    };
  }

  String toJson() => json.encode(toMap());
}

class SocketListenParams {
  SocketListenParams(
    this.event, {
    this.data,
    this.headers,
    this.timeout,
    this.isMockupSocket = false,
  });

  final String event;
  final dynamic data;
  final Map<String, dynamic>? headers;
  final Duration? timeout;
  final bool isMockupSocket;
}

class SocketConnectParams {
  SocketConnectParams({
    this.headers,
    this.timeout,
    this.autoConnect = true,
    this.transports = const ['websocket'],
  });

  final Map<String, dynamic>? headers;
  final Duration? timeout;
  final bool autoConnect;
  final List<String> transports;
}

class SocketDisconnectParams {
  SocketDisconnectParams({this.reason, this.forceClose = false});

  final String? reason;
  final bool forceClose;
}
