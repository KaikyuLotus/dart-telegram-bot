import 'dart:convert';

/// This object represents the bot's description.
class BotName {
  ///	The bot's name
  String name;

  /// Basic constructor
  BotName({
    required this.name,
  });

  /// Creates an object from a json
  factory BotName.fromJson(Map<String, dynamic> json) {
    return BotName(
      name: json['name'],
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }

  @override
  String toString() => json.encode(this);
}
