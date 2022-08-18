import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents a link to a sticker stored on the Telegram servers.
/// By default, this sticker will be sent by the user.
/// Alternatively, you can use input_message_content to send a message with
/// the specified content instead of the sticker.
class InlineQueryResultCachedSticker extends InlineQueryResult {
  /// Type of the result, must be sticker
  String type = 'sticker';

  /// Unique identifier for this result, 1-64 bytes
  String id;

  /// 	A valid file identifier of the sticker
  String stickerFileId;

  /// Optional.
  /// Inline keyboard attached to the message
  InlineKeyboardMarkup? replyMarkup;

  /// Optional.
  /// Content of the message to be sent instead of the sticker
  InputMessageContent? inputMessageContent;

  /// Basic constructor
  InlineQueryResultCachedSticker({
    required this.id,
    required this.stickerFileId,
    this.replyMarkup,
    this.inputMessageContent,
  });

  /// Creates a json from the object
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
