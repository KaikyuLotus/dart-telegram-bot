import 'dart:convert';

class MessageId {
  String messageId;

  MessageId({required this.messageId});

  static MessageId fromJson(Map<String, dynamic> json) {
    return MessageId(messageId: json['message_id']);
  }

  Map toJson() => {'message_id': messageId};

  @override
  String toString() => json.encode(this);
}
