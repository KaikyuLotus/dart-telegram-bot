import 'dart:convert';

import 'package:dart_telegram_bot/telegram_entities.dart';

class ReplyKeyboardRemove extends ReplyMarkup {
  bool removeKeyboard;
  bool selective;

  ReplyKeyboardRemove(this.removeKeyboard, {this.selective});

  factory ReplyKeyboardRemove.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return ReplyKeyboardRemove(
      json['remove_keyboard'],
      selective: json['selective'],
    );
  }

  Map toJson() {
    var map = {};
    map['remove_keyboard'] = removeKeyboard;
    map['selective'] = selective;
    map.removeWhere((k, v) => v == null);
    return map;
  }

  @override
  String toString() {
    return json.encode(this);
  }
}
