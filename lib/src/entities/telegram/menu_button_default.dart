import '../../../telegram_entities.dart';

/// Describes that no specific value for the menu button was set.
class MenuButtonDefault extends MenuButton {
  /// Type of the button, must be default
  String type = "default";

  /// Creates a json from the object
  Map toJson() {
    return {
      'type': type,
    };
  }
}
