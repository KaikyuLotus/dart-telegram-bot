import 'dart:convert';

import '../../../telegram_entities.dart';

/// This object represents an inline keyboard that appears right next to the
/// message it belongs to.
class InlineKeyboardMarkup extends ReplyMarkup {
  /// Array of button rows, each represented by an Array of InlineKeyboardButton
  /// objects
  List<List<InlineKeyboardButton>> inlineKeyboard;

  /// Basic constructor
  InlineKeyboardMarkup(this.inlineKeyboard);

  /// Creates a object from a json
  static InlineKeyboardMarkup fromJson(Map<String, dynamic> json) {
    return InlineKeyboardMarkup(
      InlineKeyboardButton.listOfListsFromJsonArray(json['inline_keyboard']),
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'inline_keyboard': inlineKeyboard,
    };
  }

  @override
  String toString() => json.encode(this);
}
