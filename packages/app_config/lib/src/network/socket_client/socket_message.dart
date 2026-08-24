class SocketMessage {
  const SocketMessage({this.event, this.data, this.id, this.isAck = false});

  final String? event;
  final Map<String, dynamic>? data;
  final String? id;
  final bool isAck;

  factory SocketMessage.fromJson(Map<String, dynamic> json) {
    return SocketMessage(
      event: json['event'] as String?,
      data: json['data'],
      id: json['id'] as String?,
      isAck: json['ack'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {'event': event, 'data': data, 'id': id, 'ack': isAck};
  }
}
