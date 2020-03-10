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

  InlineKeyboardButton._(this.text,
      {this.url,
      this.login_url,
      this.callback_data,
      this.switch_inline_query,
      this.switch_inline_query_current_chat,
      this.callback_game,
      this.pay});

  InlineKeyboardButton.URL(this.text, this.url);

  InlineKeyboardButton.LoginURL(this.text, this.login_url);

  InlineKeyboardButton.CallbackData(this.text, this.callback_data);

  InlineKeyboardButton.SwitchInlineQuery(this.text, this.switch_inline_query);

  InlineKeyboardButton.SwitchInlineQueryCurrentChat(this.text, this.switch_inline_query_current_chat);

  InlineKeyboardButton.CallbackGame(this.text, this.callback_game);

  InlineKeyboardButton.Pay(this.text, this.pay);

  Map toJson() {
    var data = {};
    data['text'] = text;
    data['url'] = url;
    data['login_url'] = login_url;
    data['callback_data'] = callback_data;
    data['switch_inline_query'] = switch_inline_query;
    data['switch_inline_query_current_chat'] = switch_inline_query_current_chat;
    data['callback_game'] = callback_game;
    data['pay'] = pay;
    data.removeWhere((k, v) => v == null);
    return data;
  }

  factory InlineKeyboardButton.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return InlineKeyboardButton._(json['text'],
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

  static List<List<InlineKeyboardButton>> listOfListsFromJsonArray(List<dynamic> json) {
    if (json == null) return null;
    return List.generate(
        json.length, (e) => List.generate(json[e].length, (i) => InlineKeyboardButton.fromJson(json[e][i])));
  }
}
