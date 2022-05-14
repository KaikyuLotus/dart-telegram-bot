import '../../../telegram_entities.dart';

class MenuButtonDefault extends MenuButton {
  String type = "default";

  Map toJson() {
    return {
      'type': type,
    };
  }
}
