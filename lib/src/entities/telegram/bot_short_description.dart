import 'dart:convert';

/// This object represents the bot's short description.
class BotShortDescription {
  ///	The bot's short description
  String shortDescription;

  /// Basic constructor
  BotShortDescription({
    required this.shortDescription,
  });

  /// Creates an object from a json
  factory BotShortDescription.fromJson(Map<String, dynamic> json) {
    return BotShortDescription(
      shortDescription: json['short_description'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'short_description': shortDescription,
    };
  }

  @override
  String toString() => json.encode(this);
}
