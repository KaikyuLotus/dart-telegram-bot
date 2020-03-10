import 'dart:convert';

import 'keyboard_button.dart';
import 'reply_markup.dart';

class ReplyKeyboardMarkup extends ReplyMarkup {
  List<List<KeyboardButton>> keyboard;
  bool resizeKeyboard;
  bool oneTimeKeyboard;
  bool selective;

  ReplyKeyboardMarkup(this.keyboard, {this.resizeKeyboard, this.oneTimeKeyboard, this.selective});

  factory ReplyKeyboardMarkup.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return ReplyKeyboardMarkup(KeyboardButton.listOfListsFromJsonArray(json['keyboard']),
        resizeKeyboard: json['resize_keyboard'],
        oneTimeKeyboard: json['one_time_keyboard'],
        selective: json['selective']);
  }

  Map toJson() {
    var map = {};
    map['keyboard'] = keyboard;
    map['resize_keyboard'] = resizeKeyboard;
    map['one_time_keyboard'] = oneTimeKeyboard;
    map['selective'] = selective;
    map.removeWhere((k, v) => v == null);
    return map;
  }

  @override
  String toString() {
    return json.encode(this);
  }
}
