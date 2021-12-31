import 'dart:convert';

import '../../../telegram_entities.dart';

class InlineQueryResultCachedSticker extends InlineQueryResult {
  String type = 'sticker';
  String id;
  String stickerFileId;
  InlineKeyboardMarkup? replyMarkup;
  InputMessageContent? inputMessageContent;

  InlineQueryResultCachedSticker({
    required this.id,
    required this.stickerFileId,
    this.replyMarkup,
    this.inputMessageContent,
  });

  Map toJson() {
    return {
      'type': type,
      'id': id,
      'sticker_file_id': stickerFileId,
      'reply_markup': replyMarkup,
      'input_message_content': inputMessageContent,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
