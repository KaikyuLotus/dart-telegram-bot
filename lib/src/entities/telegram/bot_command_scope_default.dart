import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents the default [scope](https://core.telegram.org/bots/api#botcommandscope)
/// of bot commands.
///
/// Default commands are used if no commands with a
/// [narrower scope](https://core.telegram.org/bots/api#determining-list-of-commands)
/// are specified for the user.
class BotCommandScopeDefault extends BotCommandScope {
  /// Scope type, must be default
  final String type = 'default';

  /// Basic constructor
  BotCommandScopeDefault();

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'type': type,
    };
  }

  @override
  String toString() => json.encode(this);
}
