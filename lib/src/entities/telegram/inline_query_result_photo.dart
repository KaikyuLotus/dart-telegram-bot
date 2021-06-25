import 'dart:convert';

import '../../../telegram_entities.dart';

class InlineQueryResultPhoto extends InlineQueryResult {
  String type = 'photo';
  String id;
  String photoUrl;
  String thumbUrl;
  int? photoWidth;
  int? photoHeight;
  String? title;
  String? description;
  String? caption;
  ParseMode? parseMode;
  List<MessageEntity>? captionEntities;
  InlineKeyboardMarkup? replyMarkup;
  InputMessageContent? inputMessageContent;

  InlineQueryResultPhoto({
    required this.id,
    required this.photoUrl,
    required this.thumbUrl,
    this.photoWidth,
    this.photoHeight,
    this.title,
    this.description,
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
      'photo_url': photoUrl,
      'thumb_url': thumbUrl,
      'photo_width': photoWidth,
      'photo_height': photoHeight,
      'title': title,
      'description': description,
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
