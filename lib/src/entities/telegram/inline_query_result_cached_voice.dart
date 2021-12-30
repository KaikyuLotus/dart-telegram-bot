import 'dart:convert';

import '../../../telegram_entities.dart';

class InlineQueryResultCachedVoice extends InlineQueryResult {
  String type = 'voice';
  String id;
  String voiceFileId;
  String title;
  String? caption;
  ParseMode? parseMode;
  List<MessageEntity>? captionEntities;
  InlineKeyboardMarkup? replyMarkup;
  InputMessageContent? inputMessageContent;

  InlineQueryResultCachedVoice({
    required this.id,
    required this.voiceFileId,
    required this.title,
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
      'voice_file_id': voiceFileId,
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
