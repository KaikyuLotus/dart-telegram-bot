import '../../../telegram_entities.dart';

class MenuButtonCommands extends MenuButton {
  String type = "commands";

  Map toJson() {
    return {
      'type': type,
    };
  }
}
