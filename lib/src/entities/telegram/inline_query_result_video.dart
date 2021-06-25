import 'dart:convert';

import '../../../telegram_entities.dart';

class InlineQueryResultVideo extends InlineQueryResult {
  String type = 'video';
  String id;
  String videoUrl;
  String mimeType;
  String thumbUrl;
  String title;
  String? caption;
  ParseMode? parseMode;
  List<MessageEntity>? captionEntities;
  int? videoWidth;
  int? videoHeight;
  int? videoDuration;
  String? description;
  InlineKeyboardMarkup? replyMarkup;
  InputMessageContent? inputMessageContent;

  InlineQueryResultVideo({
    required this.id,
    required this.videoUrl,
    required this.mimeType,
    required this.thumbUrl,
    required this.title,
    this.caption,
    this.parseMode,
    this.captionEntities,
    this.videoWidth,
    this.videoHeight,
    this.videoDuration,
    this.description,
    this.replyMarkup,
    this.inputMessageContent,
  });

  Map toJson() {
    return {
      'type': type,
      'id': id,
      'video_url': videoUrl,
      'mime_type': mimeType,
      'thumb_url': thumbUrl,
      'title': title,
      'caption': caption,
      'parse_mode': parseMode,
      'caption_entities': captionEntities,
      'video_width': videoWidth,
      'video_height': videoHeight,
      'video_duration': videoDuration,
      'description': description,
      'reply_markup': replyMarkup,
      'input_message_content': inputMessageContent,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
