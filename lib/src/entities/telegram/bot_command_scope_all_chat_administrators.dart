import 'dart:convert';

import '../../../telegram_entities.dart';

class BotCommandScopeAllChatAdministrators extends BotCommandScope {
  final String type = 'all_chat_administrators';

  BotCommandScopeAllChatAdministrators();

  Map toJson() {
    return {
      'type': type,
    };
  }

  @override
  String toString() => json.encode(this);
}
