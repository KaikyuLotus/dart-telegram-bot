import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// This object represents one button of an inline keyboard.
/// You must use exactly one of the optional fields.
class InlineKeyboardButton {
  /// Label text on the button
  String text;

  /// Optional.
  /// HTTP or tg:// URL to be opened when the button is pressed.
  /// Links tg://user?id=<user_id> can be used to mention a user by their
  /// ID without using a username, if this is allowed by their privacy settings.
  String? url;

  /// Optional.
  /// An HTTPS URL used to automatically authorize the user.
  /// Can be used as a replacement for the Telegram Login Widget.
  LoginUrl? loginUrl;

  /// Optional.
  /// Data to be sent in a callback query to the bot when button is pressed,
  /// 1-64 bytes
  String? callbackData;

  /// Optional.
  /// Description of the Web App that will be launched when the user presses the
  /// button.
  /// The Web App will be able to send an arbitrary message on behalf of the
  /// user using the method answerWebAppQuery. Available only in private chats
  /// between a user and the bot.
  WebAppInfo? webApp;

  /// Optional.
  /// If set, pressing the button will prompt the user to select one of their
  /// chats, open that chat and insert the bot's username and the specified
  /// inline query in the input field.
  /// May be empty, in which case just the bot's username will be inserted.
  String? switchInlineQuery;

  /// Optional.
  /// If set, pressing the button will insert the bot's username and the
  /// specified inline query in the current chat's input field.
  /// May be empty, in which case only the bot's username will be inserted.
  String? switchInlineQueryCurrentChat;

  /// Optional.
  /// If set, pressing the button will prompt the user to select one of their
  /// chats of the specified type, open that chat and insert the bot's username
  /// and the specified inline query in the input field
  SwitchInlineQueryChosenChat? switchInlineQueryChosenChat;

  /// Optional. Description of the game that will be launched when the user
  /// presses the button.
  CallbackGame? callbackGame;

  /// Optional.
  /// Specify True, to send a Pay button.
  bool? pay;

  InlineKeyboardButton._(
    this.text, {
    this.url,
    this.loginUrl,
    this.callbackData,
    this.webApp,
    this.switchInlineQuery,
    this.switchInlineQueryCurrentChat,
    this.switchInlineQueryChosenChat,
    this.callbackGame,
    this.pay,
  });

  /// Url constructor
  InlineKeyboardButton.url(this.text, this.url);

  /// LoginUrl constructor
  InlineKeyboardButton.loginURL(this.text, this.loginUrl);

  /// CallbackData constructor
  InlineKeyboardButton.callbackData(this.text, this.callbackData);

  /// WebApp constructor
  InlineKeyboardButton.webApp(this.text, this.webApp);

  /// SwitchInlineQuery constructor
  InlineKeyboardButton.switchInlineQuery(this.text, this.switchInlineQuery);

  /// SwitchInlineQueryCurrentChat constructor
  InlineKeyboardButton.switchInlineQueryCurrentChat(
    this.text,
    this.switchInlineQueryCurrentChat,
  );

  /// SwitchInlineQueryChosenChat constructor
  InlineKeyboardButton.switchInlineQueryChosenChat(
    this.text,
    this.switchInlineQueryChosenChat,
  );

  /// CallbackGame constructor
  InlineKeyboardButton.callbackGame(this.text, this.callbackGame);

  /// Pay constructor
  InlineKeyboardButton.pay(this.text, {this.pay});

  /// Creates a object from a json
  static InlineKeyboardButton fromJson(Map<String, dynamic> json) {
    return InlineKeyboardButton._(
      json['text']!,
      url: json['url'],
      loginUrl: callIfNotNull(LoginUrl.fromJson, json['login_url']),
      callbackData: json['callback_data'],
      webApp: callIfNotNull(WebAppInfo.fromJson, json['web_app']),
      switchInlineQuery: json['switch_inline_query'],
      switchInlineQueryCurrentChat: json['switch_inline_query_current_chat'],
      switchInlineQueryChosenChat: json['switch_inline_query_chosen_chat'],
      callbackGame: callIfNotNull(CallbackGame.fromJson, json['callback_game']),
      pay: json['pay'],
    );
  }

  /// Creates a list of object from a json array
  static List<InlineKeyboardButton> listFromJsonArray(List<dynamic> json) {
    return List.generate(
      json.length,
      (i) => InlineKeyboardButton.fromJson(json[i]),
    );
  }

  /// Creates a list of list of object from a json array
  static List<List<InlineKeyboardButton>> listOfListsFromJsonArray(
      List<dynamic> json) {
    return List.generate(
      json.length,
      (e) => List.generate(
        json[e].length,
        (i) => InlineKeyboardButton.fromJson(json[e][i]),
      ),
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'text': text,
      'url': url,
      'login_url': loginUrl,
      'callback_data': callbackData,
      'web_app': webApp,
      'switch_inline_query': switchInlineQuery,
      'switch_inline_query_current_chat': switchInlineQueryCurrentChat,
      'switch_inline_query_chosen_chat': switchInlineQueryChosenChat,
      'callback_game': callbackGame,
      'pay': pay,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
