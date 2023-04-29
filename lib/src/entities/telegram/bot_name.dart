import 'dart:convert';

/// This object represents the bot's description.
class BotName {
  ///	The bot's name
  String name;

  /// Basic constructor
  BotName({
    required this.name,
  });

  /// Creates a object from a json
  static BotName fromJson(Map<String, dynamic> json) {
    return BotName(
      name: json['name'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'name': name,
    };
  }

  @override
  String toString() => json.encode(this);
}
