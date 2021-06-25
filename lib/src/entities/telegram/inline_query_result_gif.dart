import 'dart:convert';

import '../../../telegram_entities.dart';

class InlineQueryResultGif extends InlineQueryResult {
  String type = 'gif';
  String id;
  String gifUrl;
  int? gifWidth;
  int? gifHeight;
  int? gifDuration;
  String thumbUrl;
  String? thumbMimeType;
  String? title;
  String? caption;
  ParseMode? parseMode;
  List<MessageEntity>? captionEntities;
  InlineKeyboardMarkup? replyMarkup;
  InputMessageContent? inputMessageContent;

  InlineQueryResultGif({
    required this.id,
    required this.gifUrl,
    this.gifWidth,
    this.gifHeight,
    this.gifDuration,
    required this.thumbUrl,
    this.thumbMimeType,
    this.title,
    this.caption,
    this.parseMode,
    this.captionEntities,
    this.replyMarkup,
    this.inputMessageContent,
  });

  Map toJson() {
    return {
      'type': type,
      'id': id,
      'gif_url': gifUrl,
      'gif_width': gifWidth,
      'gif_height': gifHeight,
      'gif_duration': gifDuration,
      'thumb_url': thumbUrl,
      'thumb_mime_type': thumbMimeType,
      'title': title,
      'caption': caption,
      'parse_mode': parseMode,
      'caption_entities': captionEntities,
      'reply_markup': replyMarkup,
      'input_message_content': inputMessageContent,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
