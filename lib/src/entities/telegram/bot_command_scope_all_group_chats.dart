import 'dart:convert';

import '../../../telegram_entities.dart';

class BotCommandScopeAllGroupChats extends BotCommandScope {
  final String type = 'all_group_chats';

  BotCommandScopeAllGroupChats();

  Map toJson() {
    return {
      'type': type,
    };
  }

  @override
  String toString() => json.encode(this);
}
