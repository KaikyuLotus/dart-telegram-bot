import 'dart:convert';

import '../../../telegram_entities.dart';

class BotCommandScopeChatMember extends BotCommandScope {
  final String type = 'chat_member';
  ChatID chatId;
  int userId;

  BotCommandScopeChatMember(
    this.chatId,
    this.userId,
  );

  Map toJson() {
    return {
      'type': type,
      'chat_id': chatId,
      'user_id': userId,
    };
  }

  @override
  String toString() => json.encode(this);
}
