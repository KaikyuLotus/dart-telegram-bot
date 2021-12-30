import 'dart:convert';

import '../../../telegram_entities.dart';

class InlineQueryResultCachedMpeg4Gif extends InlineQueryResult {
  String type = 'mpeg4_gif';
  String id;
  String mpeg4FileId;
  String? title;
  String? caption;
  ParseMode? parseMode;
  List<MessageEntity>? captionEntities;
  InlineKeyboardMarkup? replyMarkup;
  InputMessageContent? inputMessageContent;

  InlineQueryResultCachedMpeg4Gif({
    required this.id,
    required this.mpeg4FileId,
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
      'mpeg4_file_id': mpeg4FileId,
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
