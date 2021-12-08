import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

class ChatJoinRequest {
  Chat chat;
  User from;
  int date;
  String? bio;
  ChatInviteLink? inviteLink;

  ChatJoinRequest({
    required this.chat,
    required this.from,
    required this.date,
    this.bio,
    this.inviteLink,
  });

  static ChatJoinRequest fromJson(Map<String, dynamic> json) {
    return ChatJoinRequest(
      chat: Chat.fromJson(json['chat']!),
      from: User.fromJson(json['from']!),
      date: json['date']!,
      bio: json['bio'],
      inviteLink: callIfNotNull(ChatInviteLink.fromJson, json['invite_link']),
    );
  }

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
