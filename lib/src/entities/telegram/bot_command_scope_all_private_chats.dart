import 'dart:convert';

import '../../../telegram_entities.dart';

class BotCommandScopeAllPrivateChats extends BotCommandScope {
  final String type = 'all_private_chats';

  BotCommandScopeAllPrivateChats();

  Map toJson() {
    return {
      'type': type,
    };
  }

  @override
  String toString() => json.encode(this);
}
