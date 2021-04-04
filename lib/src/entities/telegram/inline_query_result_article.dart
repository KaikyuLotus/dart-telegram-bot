import 'dart:convert';

import '../../../telegram_entities.dart';

class InlineQueryResultArticle extends InlineQueryResult {
  String type = 'article';
  String id;
  String title;
  InputMessageContent inputMessageContent;
  InlineKeyboardMarkup? replyMarkup;
  String? url;
  bool? hideUrl;
  String? description;
  String? thumbUrl;
  int? thumbWidth;
  int? thumbHeight;

  InlineQueryResultArticle({
    required this.id,
    required this.title,
    required this.inputMessageContent,
    this.replyMarkup,
    this.url,
    this.hideUrl,
    this.description,
    this.thumbUrl,
    this.thumbWidth,
    this.thumbHeight,
  });

  Map toJson() {
    return {
      'type': type,
      'id': id,
      'title': title,
      'input_message_content': inputMessageContent,
      'reply_markup': replyMarkup,
      'url': url,
      'hide_url': hideUrl,
      'description': description,
      'thumb_url': thumbUrl,
      'thumCbWidth': thumbWidth,
      'thumb_height': thumbHeight,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
