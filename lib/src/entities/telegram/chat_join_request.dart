import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// Represents a join request sent to a chat.
class ChatJoinRequest {
  /// Chat to which the request was sent
  Chat chat;

  /// User that sent the join request
  User from;

  /// Identifier of a private chat with the user who sent the join request.
  /// This number may have more than 32 significant bits and some programming
  /// languages may have difficulty/silent defects in interpreting it.
  /// But it has at most 52 significant bits, so a 64-bit integer or
  /// double-precision float type are safe for storing this identifier.
  /// The bot can use this identifier for 24 hours to send messages until the
  /// join request is processed, assuming no other administrator
  /// contacted the user.
  int userChatId;

  /// Date the request was sent in Unix time
  int date;

  /// Optional.
  /// Bio of the user.
  String? bio;

  /// Optional.
  /// Chat invite link that was used by the user to send the join request
  ChatInviteLink? inviteLink;

  /// Basic constructor
  ChatJoinRequest({
    required this.chat,
    required this.from,
    required this.userChatId,
    required this.date,
    this.bio,
    this.inviteLink,
  });

  /// Creates a object from a json
  static ChatJoinRequest fromJson(Map<String, dynamic> json) {
    return ChatJoinRequest(
      chat: Chat.fromJson(json['chat']!),
      from: User.fromJson(json['from']!),
      userChatId: json['user_chat_id']!,
      date: json['date']!,
      bio: json['bio'],
      inviteLink: callIfNotNull(ChatInviteLink.fromJson, json['invite_link']),
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'chat': chat,
      'from': from,
      'user_chat_id': userChatId,
      'date': date,
      'bio': bio,
      'invite_link': inviteLink,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
