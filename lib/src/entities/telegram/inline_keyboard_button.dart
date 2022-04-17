import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

class InlineKeyboardButton {
  String text;
  String? url;
  LoginUrl? loginUrl;
  String? callbackData;
  WebAppInfo? webApp;
  String? switchInlineQuery;
  String? switchInlineQueryCurrentChat;
  CallbackGame? callbackGame;
  bool? pay;

  InlineKeyboardButton._(
    this.text, {
    this.url,
    this.loginUrl,
    this.callbackData,
    this.webApp,
    this.switchInlineQuery,
    this.switchInlineQueryCurrentChat,
    this.callbackGame,
    this.pay,
  });

  InlineKeyboardButton.url(this.text, this.url);

  InlineKeyboardButton.loginURL(this.text, this.loginUrl);

  InlineKeyboardButton.callbackData(this.text, this.callbackData);

  InlineKeyboardButton.webApp(this.text, this.webApp);

  InlineKeyboardButton.switchInlineQuery(this.text, this.switchInlineQuery);

  InlineKeyboardButton.switchInlineQueryCurrentChat(
    this.text,
    this.switchInlineQueryCurrentChat,
  );

  InlineKeyboardButton.callbackGame(this.text, this.callbackGame);

  InlineKeyboardButton.pay(this.text, {this.pay});

  static InlineKeyboardButton fromJson(Map<String, dynamic> json) {
    return InlineKeyboardButton._(
      json['text']!,
      url: json['url'],
      loginUrl: callIfNotNull(LoginUrl.fromJson, json['login_url']),
      callbackData: json['callback_data'],
      webApp: callIfNotNull(WebAppInfo.fromJson, json['web_app']),
      switchInlineQuery: json['switch_inline_query'],
      switchInlineQueryCurrentChat: json['switch_inline_query_current_chat'],
      callbackGame: callIfNotNull(CallbackGame.fromJson, json['callback_game']),
      pay: json['pay'],
    );
  }

  static List<InlineKeyboardButton> listFromJsonArray(List<dynamic> json) {
    return List.generate(
      json.length,
      (i) => InlineKeyboardButton.fromJson(json[i]),
    );
  }

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

  Map toJson() {
    return {
      'text': text,
      'url': url,
      'login_url': loginUrl,
      'callback_data': callbackData,
      'web_app': webApp,
      'switch_inline_query': switchInlineQuery,
      'switch_inline_query_current_chat': switchInlineQueryCurrentChat,
      'callback_game': callbackGame,
      'pay': pay,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
