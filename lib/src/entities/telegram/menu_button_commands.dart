import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents a menu button, which opens the bot's list of commands.
class MenuButtonCommands extends MenuButton {
  /// Type of the button, must be commands
  @override
  String type = 'commands';

  /// Basic constructor
  MenuButtonCommands();

  /// Creates an object from a json
  factory MenuButtonCommands.fromJson(Map<String, dynamic> _) {
    return MenuButtonCommands();
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'type': type,
    };
  }

  @override
  String toString() => json.encode(this);
}
