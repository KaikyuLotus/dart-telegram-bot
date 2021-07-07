import 'dart:convert';

import '../../../telegram_entities.dart';

class ReplyKeyboardRemove extends ReplyMarkup {
  bool removeKeyboard;
  bool? selective;

  ReplyKeyboardRemove({
    required this.removeKeyboard,
    this.selective,
  });

  static ReplyKeyboardRemove fromJson(Map<String, dynamic> json) {
    return ReplyKeyboardRemove(
      removeKeyboard: json['remove_keyboard']!,
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
