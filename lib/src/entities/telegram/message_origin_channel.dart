import 'dart:convert';

import '../../../telegram_entities.dart';

/// The message was originally sent to a channel chat.
class MessageOriginChannel extends MessageOrigin {
  /// Type of the message origin, always “channel”
  @override
  String type = 'channel';

  /// Date the message was sent originally in Unix time
  @override
  int date;

  /// Channel chat to which the message was originally sent
  Chat chat;

  /// Unique message identifier inside the chat
  int messageId;

  /// Optional.
  /// Signature of the original post author
  String? authorSignature;

  /// Basic constructor
  MessageOriginChannel({
    required this.date,
    required this.chat,
    required this.messageId,
    this.authorSignature,
  });

  /// Creates an object from a json
  factory MessageOriginChannel.fromJson(Map<String, dynamic> json) {
    return MessageOriginChannel(
      date: json['date'],
      chat: Chat.fromJson(json['chat']),
      messageId: json['message_id'],
      authorSignature: json['author_signature'],
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'date': date,
      'chat': chat,
      'message_id': messageId,
      'author_signature': authorSignature,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
