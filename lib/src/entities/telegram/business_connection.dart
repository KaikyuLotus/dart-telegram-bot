import 'dart:convert';

import '../../../telegram_entities.dart';

/// Describes the connection of the bot with a business account.
class BusinessConnection {
  /// Unique identifier of the business connection
  String id;

  /// Business account user that created the business connection
  User user;

  /// Identifier of a private chat with the user who created the
  /// business connection.
  ///
  /// This number may have more than 32 significant bits and some programming
  /// languages may have difficulty/silent defects in interpreting it.
  ///
  /// But it has at most 52 significant bits, so a 64-bit integer or
  /// double-precision float type are safe for storing this identifier.
  int userChatId;

  /// Date the connection was established in Unix time
  int date;

  /// True, if the bot can act on behalf of the business account in chats that
  /// were active in the last 24 hours
  bool canReply;

  /// True, if the connection is active
  bool isEnabled;

  /// Basic constructor
  BusinessConnection({
    required this.id,
    required this.user,
    required this.userChatId,
    required this.date,
    required this.canReply,
    required this.isEnabled,
  });

  /// Creates an object from a json
  factory BusinessConnection.fromJson(Map<String, dynamic> json) {
    return BusinessConnection(
      id: json['id'],
      user: User.fromJson(json['user']),
      userChatId: json['user_chat_id'],
      date: json['date'],
      canReply: json['can_reply'],
      isEnabled: json['is_enabled'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'id': id,
      'user': user,
      'user_chat_id': userChatId,
      'date': date,
      'can_reply': canReply,
      'is_enabled': isEnabled,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
