class ReplyKeyboardRemove {
  bool removeKeyboard;
  bool selective;

  ReplyKeyboardRemove({this.removeKeyboard, this.selective});

  factory ReplyKeyboardRemove.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return ReplyKeyboardRemove(removeKeyboard: json['remove_keyboard'], selective: json['selective']);
  }
}
