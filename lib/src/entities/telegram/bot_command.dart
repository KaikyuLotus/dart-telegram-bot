import 'dart:convert';

/// This object represents a bot command.
class BotCommand {
  /// Text of the command; 1-32 characters.
  ///
  /// Can contain only lowercase English letters, digits and underscores.
  String command;

  /// Description of the command; 1-256 characters.
  String description;

  /// Basic constructor
  BotCommand({
    required this.command,
    required this.description,
  });

  /// Creates an object from a json
  factory BotCommand.fromJson(Map<String, dynamic> json) {
    return BotCommand(
      command: json['command'],
      description: json['description'],
    );
  }

  /// Creates a list of objects from a json array
  static List<BotCommand> listFromJsonArray(List<dynamic> array) {
    return List.generate(
      array.length,
      (i) => BotCommand.fromJson(array[i]),
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'command': command,
      'description': description,
    };
  }

  @override
  String toString() => json.encode(this);
}
