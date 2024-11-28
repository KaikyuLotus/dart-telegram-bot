import 'dart:convert';

import '../../../telegram_entities.dart';

/// This object describes a message that was deleted or is otherwise
/// inaccessible to the bot.
class InaccessibleMessage extends MaybeInaccessibleMessage {
  /// Chat the message belonged to
  @override
  Chat chat;

  /// Unique message identifier inside the chat
  @override
  int messageId;

  /// Always 0.
  /// The field can be used to differentiate regular and inaccessible messages.
  @override
  int date;

  /// Basic constructor
  InaccessibleMessage({
    required this.chat,
    required this.messageId,
    required this.date,
  });

  /// Creates an object from a json
  factory InaccessibleMessage.fromJson(Map<String, dynamic> json) {
    return InaccessibleMessage(
      chat: Chat.fromJson(json['chat']),
      messageId: json['message_id'],
      date: json['date'],
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'chat': chat,
      'message_id': messageId,
      'date': date,
    };
  }

  @override
  String toString() => json.encode(this);
}
