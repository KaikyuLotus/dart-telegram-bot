import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// This object represents changes in the status of a chat member.
class ChatMemberUpdated {
  /// Chat the user belongs to
  Chat chat;

  /// Performer of the action, which resulted in the change
  User from;

  /// Date the change was done in Unix time
  int date;

  /// Previous information about the chat member
  ChatMember oldChatMember;

  /// New information about the chat member
  ChatMember newChatMember;

  /// Optional.
  /// Chat invite link, which was used by the user to join the chat;
  /// for joining by invite link events only.
  ChatInviteLink? inviteLink;

  /// Optional.
  /// True, if the user joined the chat via a chat folder invite link
  bool? viaChatFolderInviteLink;

  /// Basic constructor
  ChatMemberUpdated({
    required this.chat,
    required this.from,
    required this.date,
    required this.oldChatMember,
    required this.newChatMember,
    this.inviteLink,
    this.viaChatFolderInviteLink,
  });

  /// Creates a object from a json
  static ChatMemberUpdated fromJson(Map<String, dynamic> json) {
    return ChatMemberUpdated(
      chat: Chat.fromJson(json['chat']!),
      from: User.fromJson(json['from']!),
      date: json['date']!,
      oldChatMember: ChatMember.fromJson(json['old_chat_member']!),
      newChatMember: ChatMember.fromJson(json['new_chat_member']!),
      inviteLink: callIfNotNull(ChatInviteLink.fromJson, json['invite_link']),
      viaChatFolderInviteLink: json['via_chat_folder_invite_link'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'chat': chat,
      'from': from,
      'date': date,
      'old_chat_member': oldChatMember,
      'new_chat_member': newChatMember,
      'invite_link': inviteLink,
      'via_chat_folder_invite_link': viaChatFolderInviteLink,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
