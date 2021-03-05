import 'package:dart_telegram_bot/telegram_entities.dart';

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

  // TODO improve this
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
