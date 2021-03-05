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

  Map<String, dynamic> toJson() {
    return {
      'command': command,
      'description': description,
    };
  }
}
