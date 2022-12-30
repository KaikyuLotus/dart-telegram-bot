import 'dart:convert';

import '../../../telegram_entities.dart';

/// This object represents a custom keyboard with reply options
class ReplyKeyboardMarkup extends ReplyMarkup {
  /// Array of button rows, each represented by an Array of KeyboardButton
  /// objects
  List<List<KeyboardButton>> keyboard;

  /// Optional.
  /// Requests clients to always show the keyboard when the regular
  /// keyboard is hidden.
  /// Defaults to false, in which case the custom keyboard can be hidden and
  /// opened with a keyboard icon.
  bool? isPersistent;

  /// Optional.
  /// Requests clients to resize the keyboard vertically for optimal fit
  /// (e.g., make the keyboard smaller if there are just two rows of buttons).
  /// Defaults to false, in which case the custom keyboard is always of the
  /// same height as the app's standard keyboard.
  bool? resizeKeyboard;

  /// Optional.
  /// Requests clients to hide the keyboard as soon as it's been used.
  /// The keyboard will still be available, but clients will automatically
  /// display the usual letter-keyboard in the chat - the user can press a
  /// special button in the input field to see the custom keyboard again.
  /// Defaults to false.
  bool? oneTimeKeyboard;

  /// Optional.
  /// The placeholder to be shown in the input field when the keyboard is
  /// active; 1-64 characters
  String? inputFieldPlaceholder;

  /// Optional.
  /// Use this parameter if you want to show the keyboard to specific users
  /// only.
  /// Targets:
  /// 1) users that are @mentioned in the text of the Message object;
  /// 2) if the bot's message is a reply (has reply_to_message_id),
  /// sender of the original message.
  bool? selective;

  /// Basic constructor
  ReplyKeyboardMarkup(
    this.keyboard, {
    this.isPersistent,
    this.resizeKeyboard,
    this.oneTimeKeyboard,
    this.inputFieldPlaceholder,
    this.selective,
  });

  /// Creates a object from a json
  static ReplyKeyboardMarkup fromJson(Map<String, dynamic> json) {
    return ReplyKeyboardMarkup(
      KeyboardButton.listOfListsFromJsonArray(json['keyboard']!),
      isPersistent: json['is_persistent'],
      resizeKeyboard: json['resize_keyboard'],
      oneTimeKeyboard: json['one_time_keyboard'],
      inputFieldPlaceholder: json['input_field_placeholder'],
      selective: json['selective'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'keyboard': keyboard,
      'is_persistent': isPersistent,
      'resize_keyboard': resizeKeyboard,
      'one_time_keyboard': oneTimeKeyboard,
      'input_field_placeholder': inputFieldPlaceholder,
      'selective': selective,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
