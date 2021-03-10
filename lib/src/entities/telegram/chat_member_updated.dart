import 'dart:convert';

import 'package:dart_telegram_bot/src/entities/internal/helpers/util.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';

class ChatMemberUpdated {
  Chat chat;
  User from;
  int date;
  ChatMember oldChatMember;
  ChatMember newChatMember;
  ChatInviteLink? inviteLink;

  ChatMemberUpdated({
    required this.chat,
    required this.from,
    required this.date,
    required this.oldChatMember,
    required this.newChatMember,
    this.inviteLink,
  });

  static ChatMemberUpdated fromJson(Map<String, dynamic> json) {
    return ChatMemberUpdated(
      chat: Chat.fromJson(json['chat']!),
      from: User.fromJson(json['from']!),
      date: json['date']!,
      oldChatMember: ChatMember.fromJson(json['old_chat_member']!),
      newChatMember: ChatMember.fromJson(json['new_chat_member']!),
      inviteLink: callIfNotNull(ChatInviteLink.fromJson, json['invite_link']),
    );
  }

  Map toJson() {
    return {
      'chat': chat,
      'from': from,
      'date': date,
      'old_chat_member': oldChatMember,
      'new_chat_member': newChatMember,
      'invite_link': inviteLink,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
