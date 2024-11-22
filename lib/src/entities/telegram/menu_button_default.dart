import 'dart:convert';

import '../../../telegram_entities.dart';

/// Describes that no specific value for the menu button was set.
class MenuButtonDefault extends MenuButton {
  /// Type of the button, must be default
  @override
  String type = 'default';

  /// Basic constructor
  MenuButtonDefault();

  /// Creates a object from a json
  factory MenuButtonDefault.fromJson(Map<String, dynamic> _) {
    return MenuButtonDefault();
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'type': type,
    };
  }

  @override
  String toString() => json.encode(this);
}
