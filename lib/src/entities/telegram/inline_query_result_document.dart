import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents a link to a file.
/// By default, this file will be sent by the user with an optional caption.
/// Alternatively, you can use input_message_content to send a message with the
/// specified content instead of the file.
/// Currently, only .PDF and .ZIP files can be sent using this method.
class InlineQueryResultDocument extends InlineQueryResult {
  /// Type of the result, must be document
  String type = 'document';

  /// Unique identifier for this result, 1-64 bytes
  String id;

  /// Title for the result
  String title;

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

  /// A valid URL for the file
  String documentUrl;

  /// MIME type of the content of the file, either “application/pdf” or
  /// “application/zip”
  String mimeType;

  /// Optional.
  /// Short description of the result
  String? description;

  /// Optional.
  /// Inline keyboard attached to the message
  InlineKeyboardMarkup? replyMarkup;

  /// Optional.
  /// Content of the message to be sent instead of the file
  InputMessageContent? inputMessageContent;

  /// Optional.
  /// URL of the thumbnail (JPEG only) for the file
  String? thumbnailUrl;

  /// Optional.
  /// Thumbnail width
  int? thumbnailWidth;

  /// Optional.
  /// Thumbnail height
  int? thumbnailHeight;

  /// Basic constructor
  InlineQueryResultDocument({
    required this.id,
    required this.title,
    this.caption,
    this.parseMode,
    this.captionEntities,
    required this.documentUrl,
    required this.mimeType,
    this.description,
    this.replyMarkup,
    this.inputMessageContent,
    this.thumbnailUrl,
    this.thumbnailWidth,
    this.thumbnailHeight,
  });

  /// Creates a json from the object
  Map toJson() {
    return {
      'type': type,
      'id': id,
      'title': title,
      'caption': caption,
      'parse_mode': parseMode,
      'caption_entities': captionEntities,
      'document_url': documentUrl,
      'mime_type': mimeType,
      'description': description,
      'reply_markup': replyMarkup,
      'input_message_content': inputMessageContent,
      'thumbnail_url': thumbnailUrl,
      'thumbnail_width': thumbnailWidth,
      'thumbnail_height': thumbnailHeight,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
