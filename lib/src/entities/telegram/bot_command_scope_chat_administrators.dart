import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents the scope of bot commands, covering all administrators of a
/// specific group or supergroup chat.
class BotCommandScopeChatAdministrators extends BotCommandScope {
  /// Scope type, must be chat_administrators
  final String type = 'chat_administrators';

  /// Unique identifier for the target chat or username of the target supergroup
  ChatID chatId;

  /// Basic constructor
  BotCommandScopeChatAdministrators(this.chatId);

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
