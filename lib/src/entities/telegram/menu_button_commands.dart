import '../../../telegram_entities.dart';

/// Represents a menu button, which opens the bot's list of commands.
class MenuButtonCommands extends MenuButton {
  /// Type of the button, must be commands
  String type = "commands";

  /// Creates a json from the object
  Map toJson() {
    return {
      'type': type,
    };
  }
}
