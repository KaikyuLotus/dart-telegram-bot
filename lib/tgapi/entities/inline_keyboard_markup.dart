import 'inline_keyboard_button.dart';

class InlineKeyboardMarkup {
  List<List<InlineKeyboardButton>> inlineKeyboard;

  InlineKeyboardMarkup({this.inlineKeyboard});

  factory InlineKeyboardMarkup.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return InlineKeyboardMarkup(inlineKeyboard: InlineKeyboardButton.listOfListsFromJsonArray(json['inline_keyboard']));
  }
}
