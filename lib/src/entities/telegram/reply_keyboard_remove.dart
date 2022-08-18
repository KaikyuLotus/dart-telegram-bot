import 'dart:convert';

import '../../../telegram_entities.dart';

/// Upon receiving a message with this object, Telegram clients will remove the
/// current custom keyboard and display the default letter-keyboard.
/// By default, custom keyboards are displayed until a new keyboard is sent by
/// a bot.
/// An exception is made for one-time keyboards that are hidden immediately
/// after the user presses a button (see ReplyKeyboardMarkup).
class ReplyKeyboardRemove extends ReplyMarkup {
  /// Requests clients to remove the custom keyboard
  /// (user will not be able to summon this keyboard;
  /// if you want to hide the keyboard from sight but keep it accessible,
  /// use one_time_keyboard in ReplyKeyboardMarkup)
  bool removeKeyboard;

  /// Optional.
  /// Use this parameter if you want to remove the keyboard for specific users
  /// only.
  /// Targets:
  /// 1) users that are @mentioned in the text of the Message object;
  /// 2) if the bot's message is a reply (has reply_to_message_id),
  /// sender of the original message.
  bool? selective;

  /// Basic constructor
  ReplyKeyboardRemove({
    required this.removeKeyboard,
    this.selective,
  });

  /// Creates a object from a json
  static ReplyKeyboardRemove fromJson(Map<String, dynamic> json) {
    return ReplyKeyboardRemove(
      removeKeyboard: json['remove_keyboard']!,
      selective: json['selective'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'remove_keyboard': removeKeyboard,
      'selective': selective,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
