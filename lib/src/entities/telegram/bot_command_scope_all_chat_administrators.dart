import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents the [scope](https://core.telegram.org/bots/api#botcommandscope)
/// of bot commands, covering all group and supergroup chat administrators.
class BotCommandScopeAllChatAdministrators extends BotCommandScope {
  /// Scope type, must be all_chat_administrators
  final String type = 'all_chat_administrators';

  /// Basic constructor
  BotCommandScopeAllChatAdministrators();

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'type': type,
    };
  }

  @override
  String toString() => json.encode(this);
}
