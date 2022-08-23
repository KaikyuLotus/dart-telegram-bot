import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// Represents a join request sent to a chat.
class ChatJoinRequest {
  /// Chat to which the request was sent
  Chat chat;

  /// User that sent the join request
  User from;

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
    required this.date,
    this.bio,
    this.inviteLink,
  });

  /// Creates a object from a json
  static ChatJoinRequest fromJson(Map<String, dynamic> json) {
    return ChatJoinRequest(
      chat: Chat.fromJson(json['chat']!),
      from: User.fromJson(json['from']!),
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
      'date': date,
      'bio': bio,
      'invite_link': inviteLink,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
