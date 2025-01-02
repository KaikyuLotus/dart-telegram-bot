import '../../../telegram_entities.dart';

/// This object describes the bot's menu button in a private chat.
///
/// It should be one of:
/// [MenuButtonCommands],
/// [MenuButtonWebApp],
/// [MenuButtonDefault]
///
/// If a menu button other than [MenuButtonDefault] is set for a private chat,
/// then it is applied in the chat.
///
/// Otherwise the default menu button is applied. By default, the menu button
/// opens the list of bot commands.
abstract class MenuButton {
  abstract final String type;

  /// Creates an object from a json
  static MenuButton fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case 'commands':
        return MenuButtonCommands.fromJson(json);
      case 'web_app':
        return MenuButtonWebApp.fromJson(json);
      case 'default':
        return MenuButtonDefault.fromJson(json);
      default:
        throw Exception('MenuButton type not recognized');
    }
  }
}
