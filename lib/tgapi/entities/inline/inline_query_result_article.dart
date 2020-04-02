import 'package:dart_telegram_bot/tgapi/entities/inline/inline_query_result.dart';
import 'package:dart_telegram_bot/tgapi/entities/inline_keyboard_markup.dart';

import '../input_message_content.dart';

class InlineQueryResultArticle extends InlineQueryResult {
  String type = 'article';
  String id;
  String title;
  InputMessageContent inputMessageContent;
  InlineKeyboardMarkup replyMarkup;
  String url;
  bool hideUrl;
  String description;
  String thumbUrl;
  int thumbWidth;
  int thumbHeight;

  InlineQueryResultArticle(
      this.id,
      this.title,
      this.inputMessageContent,
      {this.replyMarkup,
      this.url,
      this.hideUrl,
      this.description,
      this.thumbUrl,
      this.thumbWidth,
      this.thumbHeight});

  factory InlineQueryResultArticle.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return InlineQueryResultArticle(
        json['id'],
        json['title'],
        InputMessageContent.fromJson(json['input_message_content']),
        replyMarkup: InlineKeyboardMarkup.fromJson(json['reply_markup']),
        url: json['url'],
        hideUrl: json['hide_url'],
        description: json['description'],
        thumbUrl: json['thumb_url'],
        thumbWidth: json['thumb_width'],
        thumbHeight: json['thumb_height']);
  }

  Map toJson() {
    var data = <String, dynamic>{};
    data['type'] = type;
    data['id'] = id;
    data['title'] = title;
    data['input_message_content'] = inputMessageContent;
    if (replyMarkup != null) data['reply_markup'] = replyMarkup;
    if (url != null) data['url'] = url;
    if (hideUrl != null) data['hide_url'] = hideUrl;
    if (description != null) data['description'] = description;
    if (thumbUrl != null) data['thumb_url'] = thumbUrl;
    if (thumbWidth != null) data['thumCbWidth'] = thumbWidth;
    if (thumbHeight != null) data['thumb_height'] = thumbHeight;
    return data;
  }
}
