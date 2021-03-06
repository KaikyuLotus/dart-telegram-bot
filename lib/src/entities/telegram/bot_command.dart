import 'dart:convert';

class BotCommand {
  String command;
  String? description;

  BotCommand({
    required this.command,
    required this.description,
  });

  static BotCommand fromJson(Map<String, dynamic> json) {
    return BotCommand(
      command: json['command']!,
      description: json['description']!,
    );
  }

  static List<BotCommand> listFromJsonArray(List<dynamic> array) {
    return List.generate(
      array.length,
      (i) => BotCommand.fromJson(array[i]),
    );
  }

  Map toJson() {
    return {
      'command': command,
      'description': description,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
