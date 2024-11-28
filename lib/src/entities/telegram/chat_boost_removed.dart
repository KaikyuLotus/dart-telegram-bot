import 'dart:convert';

import '../../../telegram_entities.dart';

/// This object represents a boost removed from a chat.
class ChatBoostRemoved {
  /// Chat which was boosted
  Chat chat;

  /// Unique identifier of the boost
  String boostId;

  /// Point in time (Unix timestamp) when the boost was removed
  int removeDate;

  /// Source of the removed boost
  ChatBoostSource source;

  /// Basic constructor
  ChatBoostRemoved({
    required this.chat,
    required this.boostId,
    required this.removeDate,
    required this.source,
  });

  /// Creates an object from a json
  factory ChatBoostRemoved.fromJson(Map<String, dynamic> json) {
    return ChatBoostRemoved(
      chat: Chat.fromJson(json['chat']),
      boostId: json['boost_id'],
      removeDate: json['remove_date'],
      source: ChatBoostSource.fromJson(json['source']),
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'chat': chat,
      'boost_id': boostId,
      'remove_date': removeDate,
      'source': source,
    };
  }

  @override
  String toString() => json.encode(this);
}
