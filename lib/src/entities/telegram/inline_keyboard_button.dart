import 'package:dart_telegram_bot/src/entities/internal/helpers/util.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';

class InlineKeyboardButton {
  String text;
  String? url;
  LoginUrl? loginUrl;
  String? callbackData;
  String? switchInlineQuery;
  String? switchInlineQueryCurrentChat;
  CallbackGame? callbackGame;
  bool? pay;

  InlineKeyboardButton._(
    this.text, {
    this.url,
    this.loginUrl,
    this.callbackData,
    this.switchInlineQuery,
    this.switchInlineQueryCurrentChat,
    this.callbackGame,
    this.pay,
  });

  InlineKeyboardButton.URL(this.text, this.url);

  InlineKeyboardButton.LoginURL(this.text, this.loginUrl);

  InlineKeyboardButton.CallbackData(this.text, this.callbackData);

  InlineKeyboardButton.SwitchInlineQuery(this.text, this.switchInlineQuery);

  InlineKeyboardButton.SwitchInlineQueryCurrentChat(
    this.text,
    this.switchInlineQueryCurrentChat,
  );

  InlineKeyboardButton.CallbackGame(this.text, this.callbackGame);

  InlineKeyboardButton.Pay(this.text, this.pay);

  static InlineKeyboardButton fromJson(Map<String, dynamic> json) {
    return InlineKeyboardButton._(
      json['text']!,
      url: json['url'],
      loginUrl: callIfNotNull(LoginUrl.fromJson, json['login_url']),
      callbackData: json['callback_data'],
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
          json[e].length, (i) => InlineKeyboardButton.fromJson(json[e][i])),
    );
  }

  Map toJson() {
    var data = {};
    data['text'] = text;
    data['url'] = url;
    data['login_url'] = loginUrl;
    data['callback_data'] = callbackData;
    data['switch_inline_query'] = switchInlineQuery;
    data['switch_inline_query_current_chat'] = switchInlineQueryCurrentChat;
    data['callback_game'] = callbackGame;
    data['pay'] = pay;
    data.removeWhere((k, v) => v == null);
    return data;
  }
}
