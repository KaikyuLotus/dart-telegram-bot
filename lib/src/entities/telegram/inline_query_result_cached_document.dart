import 'dart:convert';

import '../../../telegram_entities.dart';

class InlineQueryResultCachedDocument extends InlineQueryResult {
  String type = 'document';
  String id;
  String title;
  String documentFileId;
  String? description;
  String? caption;
  ParseMode? parseMode;
  List<MessageEntity>? captionEntities;
  InlineKeyboardMarkup? replyMarkup;
  InputMessageContent? inputMessageContent;

  InlineQueryResultCachedDocument({
    required this.id,
    required this.title,
    required this.documentFileId,
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
      'title': title,
      'document_file_id': documentFileId,
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
