import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents the default scope of bot commands.
/// Default commands are used if no commands with a narrower scope are
/// specified for the user.
class BotCommandScopeDefault extends BotCommandScope {
  /// Scope type, must be default
  final String type = 'default';

  /// Basic constructor
  BotCommandScopeDefault();

  /// Creates a json from the object
  Map toJson() {
    return {
      'type': type,
    };
  }

  @override
  String toString() => json.encode(this);
}
