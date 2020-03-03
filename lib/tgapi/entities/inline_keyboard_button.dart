import 'callback_game.dart';
import 'login_url.dart';

class InlineKeyboardButton {
  String text;
  String url;
  LoginUrl login_url;
  String callback_data;
  String switch_inline_query;
  String switch_inline_query_current_chat;
  CallbackGame callback_game;
  bool pay;

  InlineKeyboardButton(
      {this.text,
      this.url,
      this.login_url,
      this.callback_data,
      this.switch_inline_query,
      this.switch_inline_query_current_chat,
      this.callback_game,
      this.pay});

  factory InlineKeyboardButton.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return InlineKeyboardButton(
        text: json['text'],
        url: json['url'],
        login_url: LoginUrl.fromJson(json['login_url']),
        callback_data: json['callback_data'],
        switch_inline_query: json['switch_inline_query'],
        switch_inline_query_current_chat: json['switch_inline_query_current_chat'],
        callback_game: CallbackGame.fromJson(json['callback_game']),
        pay: json['pay']);
  }

  static List<InlineKeyboardButton> listFromJsonArray(List<dynamic> json) {
    if (json == null) return null;
    return List.generate(json.length, (i) => InlineKeyboardButton.fromJson(json[i]));
  }

  static List<List<InlineKeyboardButton>> listOfListsFromJsonArray(List<List<dynamic>> json) {
    if (json == null) return null;
    return List.generate(
        json.length, (e) => List.generate(json[e].length, (i) => InlineKeyboardButton.fromJson(json[e][i])));
  }
}
