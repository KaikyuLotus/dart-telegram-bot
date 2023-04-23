import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents a link to a photo. By default,
/// this photo will be sent by the user with optional caption.
/// Alternatively, you can use input_message_content to send a message with the
/// specified content instead of the photo.
class InlineQueryResultPhoto extends InlineQueryResult {
  /// Type of the result, must be photo
  String type = 'photo';

  /// Unique identifier for this result, 1-64 bytes
  String id;

  /// A valid URL of the photo. Photo must be in JPEG format.
  /// Photo size must not exceed 5MB
  String photoUrl;

  /// URL of the thumbnail for the photo
  String thumbnailUrl;

  /// Optional.
  /// Width of the photo
  int? photoWidth;

  /// Optional.
  /// Height of the photo
  int? photoHeight;

  /// Optional.
  /// Title for the result
  String? title;

  /// Optional.
  /// Short description of the result
  String? description;

  /// Optional.
  /// Caption of the photo to be sent, 0-1024 characters after entities parsing
  String? caption;

  /// Optional.
  /// Mode for parsing entities in the photo caption.
  ParseMode? parseMode;

  /// Optional.
  /// List of special entities that appear in the caption,
  /// which can be specified instead of parse_mode
  List<MessageEntity>? captionEntities;

  /// Optional.
  /// Inline keyboard attached to the message
  InlineKeyboardMarkup? replyMarkup;

  /// Optional.
  /// Content of the message to be sent instead of the photo
  InputMessageContent? inputMessageContent;

  /// Basic constructor
  InlineQueryResultPhoto({
    required this.id,
    required this.photoUrl,
    required this.thumbnailUrl,
    this.photoWidth,
    this.photoHeight,
    this.title,
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
      'photo_url': photoUrl,
      'thumbnail_url': thumbnailUrl,
      'photo_width': photoWidth,
      'photo_height': photoHeight,
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
