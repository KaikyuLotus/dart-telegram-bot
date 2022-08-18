import 'dart:convert';

import '../../../telegram_entities.dart';

/// This object represents an animated emoji that displays a random value.
class Dice {
  /// Emoji on which the dice throw animation is based
  Emoji emoji;

  ///Value of the dice, 1-6 for “🎲”, “🎯” and “🎳” base emoji, 1-5 for “🏀”
  ///and “⚽” base emoji, 1-64 for “🎰” base emoji
  int value;

  /// Basic constructor
  Dice({
    required this.emoji,
    required this.value,
  });

  /// Creates a object from a json
  static Dice fromJson(Map<String, dynamic> json) {
    return Dice(
      emoji: Emoji.forValue(json['emoji']),
      value: json['value'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'emoji': emoji,
      'value': value,
    };
  }

  @override
  String toString() => json.encode(this);
}
