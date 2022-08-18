import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents the scope of bot commands, covering all group and supergroup
/// chats
class BotCommandScopeAllGroupChats extends BotCommandScope {
  /// Scope type, must be all_group_chats
  final String type = 'all_group_chats';

  /// Basic constructor
  BotCommandScopeAllGroupChats();

  /// Creates a json from the object
  Map toJson() {
    return {
      'type': type,
    };
  }

  @override
  String toString() => json.encode(this);
}
