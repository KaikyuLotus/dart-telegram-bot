import 'dart:convert';

import '../../../telegram_entities.dart';

class BotCommandScopeChat extends BotCommandScope {
  final String type = 'chat';
  ChatID chatId;

  BotCommandScopeChat(this.chatId);

  Map toJson() {
    return {
      'type': type,
      'chat_id': chatId,
    };
  }

  @override
  String toString() => json.encode(this);
}
