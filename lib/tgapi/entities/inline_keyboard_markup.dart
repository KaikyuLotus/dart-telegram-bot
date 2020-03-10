import 'dart:convert';

import 'inline_keyboard_button.dart';
import 'reply_markup.dart';

class InlineKeyboardMarkup extends ReplyMarkup {
  List<List<InlineKeyboardButton>> inlineKeyboard;

  InlineKeyboardMarkup(this.inlineKeyboard);

  factory InlineKeyboardMarkup.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return InlineKeyboardMarkup(InlineKeyboardButton.listOfListsFromJsonArray(json['inline_keyboard']));
  }

  Map toJson() {
    var data = {};
    data['inline_keyboard'] = inlineKeyboard;
    return data;
  }

  @override
  String toString() {
    return json.encode(this);
  }
}
