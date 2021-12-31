import 'dart:convert';

import '../../../telegram_entities.dart';

class InlineQueryResultAudio extends InlineQueryResult {
  String type = 'audio';
  String id;
  String audioUrl;
  String title;
  String? caption;
  ParseMode? parseMode;
  List<MessageEntity>? captionEntities;
  String? performer;
  int? audioDuration;
  InlineKeyboardMarkup? replyMarkup;
  InputMessageContent? inputMessageContent;

  InlineQueryResultAudio({
    required this.id,
    required this.audioUrl,
    required this.title,
    this.caption,
    this.parseMode,
    this.captionEntities,
    this.performer,
    this.audioDuration,
    this.replyMarkup,
    this.inputMessageContent,
  });

  Map toJson() {
    return {
      'type': type,
      'id': id,
      'audio_url': audioUrl,
      'title': title,
      'caption': caption,
      'parse_mode': parseMode,
      'caption_entities': captionEntities,
      'performer': performer,
      'audio_duration': audioDuration,
      'reply_markup': replyMarkup,
      'input_message_content': inputMessageContent,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
