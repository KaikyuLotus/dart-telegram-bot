import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents the [scope](https://core.telegram.org/bots/api#botcommandscope)
/// of bot commands, covering a specific chat.
class BotCommandScopeChat extends BotCommandScope {
  /// Scope type, must be chat
  final String type = 'chat';

  /// Unique identifier for the target chat or username of the target supergroup
  /// (in the format `@supergroupusername`)
  ChatID chatId;

  /// Basic constructor
  BotCommandScopeChat(this.chatId);

  /// Creates a json from the object
  Map toJson() {
    return {
      'type': type,
      'chat_id': chatId,
    };
  }

  @override
  String toString() => json.encode(this);
}
