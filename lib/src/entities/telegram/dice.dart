import 'dart:convert';

import '../../../telegram_entities.dart';

class Dice {
  Emoji emoji;
  int value;

  Dice({
    required this.emoji,
    required this.value,
  });

  static Dice fromJson(Map<String, dynamic> json) {
    return Dice(
      emoji: json['emoji'],
      value: json['value'],
    );
  }

  Map toJson() {
    return {
      'emoji': emoji,
      'value': value,
    };
  }

  @override
  String toString() => json.encode(this);
}
