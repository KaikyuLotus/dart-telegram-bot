import 'dart:convert';

import 'package:dart_telegram_bot/telegram_entities.dart';

class ReplyKeyboardRemove extends ReplyMarkup {
  bool removeKeyboard;
  bool? selective;

  ReplyKeyboardRemove(
    this.removeKeyboard, {
    this.selective,
  });

  static ReplyKeyboardRemove fromJson(Map<String, dynamic> json) {
    return ReplyKeyboardRemove(
      json['remove_keyboard']!,
      selective: json['selective'],
    );
  }

  Map toJson() {
    return {
      'remove_keyboard': removeKeyboard,
      'selective': selective,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
