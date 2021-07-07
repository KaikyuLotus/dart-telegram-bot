import 'dart:convert';

import '../../../telegram_entities.dart';

class InlineKeyboardMarkup extends ReplyMarkup {
  List<List<InlineKeyboardButton>> inlineKeyboard;

  InlineKeyboardMarkup(this.inlineKeyboard);

  static InlineKeyboardMarkup fromJson(Map<String, dynamic> json) {
    return InlineKeyboardMarkup(
      InlineKeyboardButton.listOfListsFromJsonArray(json['inline_keyboard']),
    );
  }

  Map toJson() {
    return {
      'inline_keyboard': inlineKeyboard,
    };
  }

  @override
  String toString() => json.encode(this);
}
