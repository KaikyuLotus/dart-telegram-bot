import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents the [scope](https://core.telegram.org/bots/api#botcommandscope)
/// of bot commands, covering all group and supergroup chats
class BotCommandScopeAllGroupChats extends BotCommandScope {
  /// Scope type, must be all_group_chats
  final String type = 'all_group_chats';

  /// Basic constructor
  BotCommandScopeAllGroupChats();

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'type': type,
    };
  }

  @override
  String toString() => json.encode(this);
}
