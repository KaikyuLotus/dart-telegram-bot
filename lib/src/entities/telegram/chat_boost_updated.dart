import 'dart:convert';

import '../../../telegram_entities.dart';

/// This object represents a boost added to a chat or changed.
class ChatBoostUpdated {
  /// Chat which was boosted
  Chat chat;

  /// Information about the chat boost
  ChatBoost boost;

  /// Basic constructor
  ChatBoostUpdated({
    required this.chat,
    required this.boost,
  });

  /// Creates an object from a json
  factory ChatBoostUpdated.fromJson(Map<String, dynamic> json) {
    return ChatBoostUpdated(
      chat: Chat.fromJson(json['chat']),
      boost: ChatBoost.fromJson(json['boost']),
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'chat': chat,
      'boost': boost,
    };
  }

  @override
  String toString() => json.encode(this);
}
