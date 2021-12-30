import 'dart:convert';

import '../../../telegram_entities.dart';

class InlineQueryResultVoice extends InlineQueryResult {
  String type = 'voice';
  String id;
  String voiceUrl;
  String title;
  String? caption;
  ParseMode? parseMode;
  List<MessageEntity>? captionEntities;
  int? voiceDuration;
  InlineKeyboardMarkup? replyMarkup;
  InputMessageContent? inputMessageContent;

  InlineQueryResultVoice({
    required this.id,
    required this.voiceUrl,
    required this.title,
    this.caption,
    this.parseMode,
    this.captionEntities,
    this.voiceDuration,
    this.replyMarkup,
    this.inputMessageContent,
  });

  Map toJson() {
    return {
      'type': type,
      'id': id,
      'voice_url': voiceUrl,
      'title': title,
      'caption': caption,
      'parse_mode': parseMode,
      'caption_entities': captionEntities,
      'voice_duration': voiceDuration,
      'reply_markup': replyMarkup,
      'input_message_content': inputMessageContent,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
