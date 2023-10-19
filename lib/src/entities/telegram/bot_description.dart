import 'dart:convert';

/// This object represents the bot's description.
class BotDescription {
  ///	The bot's description
  String description;

  /// Basic constructor
  BotDescription({
    required this.description,
  });

  /// Creates a object from a json
  static BotDescription fromJson(Map<String, dynamic> json) {
    return BotDescription(
      description: json['description'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'description': description,
    };
  }

  @override
  String toString() => json.encode(this);
}
