import 'dart:convert';

/// This object represents the bot's description.
class BotDescription {
  ///	The bot's description
  String description;

  /// Basic constructor
  BotDescription({
    required this.description,
  });

  /// Creates an object from a json
  factory BotDescription.fromJson(Map<String, dynamic> json) {
    return BotDescription(
      description: json['description'],
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'description': description,
    };
  }

  @override
  String toString() => json.encode(this);
}
