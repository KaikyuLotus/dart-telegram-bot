import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents a link to a file stored on the Telegram servers.
/// By default, this file will be sent by the user with an optional caption.
/// Alternatively, you can use input_message_content to send a message with the
/// specified content instead of the file.
class InlineQueryResultCachedDocument extends InlineQueryResult {
  /// Type of the result, must be document
  String type = 'document';

  /// Unique identifier for this result, 1-64 bytes
  String id;

  /// Title for the result
  String title;

  /// A valid file identifier for the file
  String documentFileId;

  /// Optional.
  /// Short description of the result
  String? description;

  /// Optional.
  /// Caption of the document to be sent, 0-1024 characters after entities
  /// parsing
  String? caption;

  /// Optional.
  /// Mode for parsing entities in the document caption.
  ParseMode? parseMode;

  /// Optional.
  /// List of special entities that appear in the caption,
  /// which can be specified instead of parse_mode
  List<MessageEntity>? captionEntities;

  /// Optional.
  /// Inline keyboard attached to the message
  InlineKeyboardMarkup? replyMarkup;

  /// Optional.
  /// Content of the message to be sent instead of the file
  InputMessageContent? inputMessageContent;

  /// Basic constructor
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

  /// Creates a json from the object
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
