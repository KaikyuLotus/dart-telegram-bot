import 'keyboard_button.dart';

class InlineKeyboardMarkup {
  List<List<KeyboardButton>> keyboard;
  bool resizeKeyboard;
  bool oneTimeKeyboardbool;
  bool selective;

  InlineKeyboardMarkup({this.keyboard, this.resizeKeyboard, this.oneTimeKeyboardbool, this.selective});

  factory InlineKeyboardMarkup.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return InlineKeyboardMarkup(
        keyboard: KeyboardButton.listOfListsFromJsonArray(json['keyboard']),
        resizeKeyboard: json['resize_keyboard'],
        oneTimeKeyboardbool: json['one_time_keyboardbool'],
        selective: json['selective']);
  }
}
