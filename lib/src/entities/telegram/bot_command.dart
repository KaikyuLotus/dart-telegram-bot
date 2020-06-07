part of '../../entities.dart';

class BotCommand {
  String command;
  String description;

  BotCommand(this.command, this.description);

  factory BotCommand.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return BotCommand(
      json['command'],
      json['description'],
    );
  }

  static List<BotCommand> listFromJsonArray(List<dynamic> array) {
    if (array == null) return null;
    return List.generate(array.length, (i) => BotCommand.fromJson(array[i]));
  }

  Map<String, dynamic> toJson() {
    return {
      'command': command,
      'description': description,
    };
  }
}
