import 'dart:convert';

import '../../../telegram_entities.dart';

class InlineQueryResultCachedVideo extends InlineQueryResult {
  String type = 'video';
  String id;
  String videoFileId;
  String title;
  String? description;
  String? caption;
  ParseMode? parseMode;
  List<MessageEntity>? captionEntities;
  InlineKeyboardMarkup? replyMarkup;
  InputMessageContent? inputMessageContent;

  InlineQueryResultCachedVideo({
    required this.id,
    required this.videoFileId,
    required this.title,
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
      'video_file_id': videoFileId,
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
