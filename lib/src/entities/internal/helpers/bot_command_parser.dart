import 'package:dart_telegram_bot/telegram_entities.dart';

class BotCommandParser {
  static final _commandRegex = RegExp(r'^(?:\/|!)(\w+)(?:@(\w+(?:bot)))?(?:\s(.+))?$', caseSensitive: false);

  String command;
  String? botUsername;
  List<String> args = [];

  BotCommandParser(this.command, this.botUsername, {required this.args});

  bool isToBot(String targetBotUsername) {
    return botUsername == null || targetBotUsername.toLowerCase() == botUsername!.toLowerCase();
  }

  bool matchesCommand(String command, {String? targetBotUsername}) {
    if (targetBotUsername != null) {
      if (!isToBot(targetBotUsername)) {
        return false;
      }
    }
    return command.toLowerCase() == this.command.toLowerCase();
  }

  static BotCommandParser? fromMessage(Message message) {
    var match = _commandRegex.firstMatch(message.text!);
    if (match == null) return null;

    var command = match.group(1)!;
    var username = match.group(2);
    var foundArgs = match.group(3);

    if (foundArgs != null) {
      return BotCommandParser(command, username, args: foundArgs.split(' '));
    }

    return BotCommandParser(command, username, args: []);
  }
}
