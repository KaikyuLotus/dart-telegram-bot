import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents the [scope](https://core.telegram.org/bots/api#botcommandscope)
/// of bot commands, covering all private chats.
class BotCommandScopeAllPrivateChats extends BotCommandScope {
  /// Scope type, must be all_private_chats
  final String type = 'all_private_chats';

  /// Basic constructor
  BotCommandScopeAllPrivateChats();

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'type': type,
    };
  }

  @override
  String toString() => json.encode(this);
}
