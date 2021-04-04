import 'dart:convert';

import '../../../telegram_entities.dart';

class ReplyKeyboardMarkup extends ReplyMarkup {
  List<List<KeyboardButton>> keyboard;
  bool? resizeKeyboard;
  bool? oneTimeKeyboard;
  bool? selective;

  ReplyKeyboardMarkup(
    this.keyboard, {
    this.resizeKeyboard,
    this.oneTimeKeyboard,
    this.selective,
  });

  static ReplyKeyboardMarkup fromJson(Map<String, dynamic> json) {
    return ReplyKeyboardMarkup(
      KeyboardButton.listOfListsFromJsonArray(json['keyboard']!),
      resizeKeyboard: json['resize_keyboard'],
      oneTimeKeyboard: json['one_time_keyboard'],
      selective: json['selective'],
    );
  }

  Map toJson() {
    return {
      'keyboard': keyboard,
      'resize_keyboard': resizeKeyboard,
      'one_time_keyboard': oneTimeKeyboard,
      'selective': selective,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
