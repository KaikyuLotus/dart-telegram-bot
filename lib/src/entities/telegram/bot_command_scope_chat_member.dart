import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents the [scope](https://core.telegram.org/bots/api#botcommandscope)
/// of bot commands, covering a specific member of a group or supergroup chat.
class BotCommandScopeChatMember extends BotCommandScope {
  /// Scope type, must be chat_member
  final String type = 'chat_member';

  /// Unique identifier for the target chat or username of the target supergroup
  /// (in the format `@supergroupusername`)
  ChatID chatId;

  /// Unique identifier of the target user
  int userId;

  /// Basic constructor
  BotCommandScopeChatMember(
    this.chatId,
    this.userId,
  );

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'chat_id': chatId,
      'user_id': userId,
    };
  }

  @override
  String toString() => json.encode(this);
}
