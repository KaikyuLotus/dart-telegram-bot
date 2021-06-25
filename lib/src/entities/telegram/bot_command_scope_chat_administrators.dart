import 'dart:convert';

import '../../../telegram_entities.dart';

class BotCommandScopeChatAdministrators extends BotCommandScope {
  final String type = 'chat_administrators';
  ChatID chatId;

  BotCommandScopeChatAdministrators(this.chatId);

  Map toJson() {
    return {
      'type': type,
      'chat_id': chatId,
    };
  }

  @override
  String toString() => json.encode(this);
}
