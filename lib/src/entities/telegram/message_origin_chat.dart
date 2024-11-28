import 'dart:convert';

import '../../../telegram_entities.dart';

/// The message was originally sent on behalf of a chat to a group chat.
class MessageOriginChat extends MessageOrigin {
  /// Type of the message origin, always “chat”
  @override
  String type = 'chat';

  /// Date the message was sent originally in Unix time
  @override
  int date;

  /// Chat that sent the message originally
  Chat senderChat;

  /// Optional.
  /// For messages originally sent by an anonymous chat administrator,
  /// original message author signature
  String? authorSignature;

  /// Basic constructor
  MessageOriginChat({
    required this.date,
    required this.senderChat,
    this.authorSignature,
  });

  /// Creates an object from a json
  factory MessageOriginChat.fromJson(Map<String, dynamic> json) {
    return MessageOriginChat(
      date: json['date'],
      senderChat: Chat.fromJson(json['sender_chat']),
      authorSignature: json['author_signature'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'type': type,
      'date': date,
      'sender_chat': senderChat,
      'author_signature': authorSignature,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
