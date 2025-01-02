import 'dart:convert';

import '../../../telegram_entities.dart';

/// This object represents reaction changes on a message with anonymous
/// reactions.
class MessageReactionCountUpdated {
  /// The chat containing the message
  Chat chat;

  /// Unique message identifier inside the chat
  int messageId;

  /// Date of the change in Unix time
  int date;

  /// List of reactions that are present on the message
  List<ReactionCount> reactions;

  /// Basic constructor
  MessageReactionCountUpdated(
    this.chat,
    this.messageId,
    this.date,
    this.reactions,
  );

  /// Creates an object from a json
  factory MessageReactionCountUpdated.fromJson(Map<String, dynamic> json) {
    return MessageReactionCountUpdated(
      Chat.fromJson(json['chat']),
      json['message_id'],
      json['date'],
      ReactionCount.listFromJsonArray(json['reactions']),
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'chat': chat,
      'message_id': messageId,
      'date': date,
      'reactions': reactions,
    };
  }

  @override
  String toString() => json.encode(this);
}
