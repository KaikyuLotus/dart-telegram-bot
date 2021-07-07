import 'dart:convert';

import '../../../telegram_entities.dart';

class InlineQueryResultMpeg4Gif extends InlineQueryResult {
  String type = 'mpeg4_gif';
  String id;
  String mpeg4Url;
  int? mpeg4Width;
  int? mpeg4Height;
  int? mpeg4Duration;
  String thumbUrl;
  String? thumbMimeType;
  String? title;
  String? caption;
  ParseMode? parseMode;
  List<MessageEntity>? captionEntities;
  InlineKeyboardMarkup? replyMarkup;
  InputMessageContent? inputMessageContent;

  InlineQueryResultMpeg4Gif({
    required this.id,
    required this.mpeg4Url,
    this.mpeg4Width,
    this.mpeg4Height,
    this.mpeg4Duration,
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
      'mpeg4_url': mpeg4Url,
      'mpeg4_width': mpeg4Width,
      'mpeg4_height': mpeg4Height,
      'mpeg4_duration': mpeg4Duration,
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
