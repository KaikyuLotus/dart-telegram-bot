import 'dart:convert';

import '../../../telegram_entities.dart';

class InlineQueryResultDocument extends InlineQueryResult {
  String type = 'document';
  String id;
  String title;
  String? caption;
  ParseMode? parseMode;
  List<MessageEntity>? captionEntities;
  String documentUrl;
  String mimeType;
  String? description;
  InlineKeyboardMarkup? replyMarkup;
  InputMessageContent? inputMessageContent;
  String? thumbUrl;
  int? thumbWidth;
  int? thumbHeight;

  InlineQueryResultDocument({
    required this.id,
    required this.title,
    this.caption,
    this.parseMode,
    this.captionEntities,
    required this.documentUrl,
    required this.mimeType,
    this.description,
    this.replyMarkup,
    this.inputMessageContent,
    this.thumbUrl,
    this.thumbWidth,
    this.thumbHeight,
  });

  Map toJson() {
    return {
      'type': type,
      'id': id,
      'title': title,
      'caption': caption,
      'parse_mode': parseMode,
      'caption_entities': captionEntities,
      'document_url': documentUrl,
      'mime_type': mimeType,
      'description': description,
      'reply_markup': replyMarkup,
      'input_message_content': inputMessageContent,
      'thumb_url': thumbUrl,
      'thumb_width': thumbWidth,
      'thumb_height': thumbHeight,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
