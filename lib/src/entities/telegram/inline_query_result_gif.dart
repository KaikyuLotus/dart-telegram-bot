import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents a link to an animated GIF file. By default, this animated GIF
/// file will be sent by the user with optional caption.
/// Alternatively, you can use input_message_content to send a message with the
/// specified content instead of the animation.
class InlineQueryResultGif extends InlineQueryResult {
  /// Type of the result, must be gif
  String type = 'gif';

  /// Unique identifier for this result, 1-64 bytes
  String id;

  /// A valid URL for the GIF file. File size must not exceed 1MB
  String gifUrl;

  /// Optional.
  /// Width of the GIF
  int? gifWidth;

  /// Optional.
  /// Height of the GIF
  int? gifHeight;

  /// Optional.
  /// Duration of the GIF in seconds
  int? gifDuration;

  /// URL of the static (JPEG or GIF) or animated (MPEG4) thumbnail for the
  /// result
  String thumbnailUrl;

  /// Optional.
  /// MIME type of the thumbnail, must be one of “image/jpeg”, “image/gif”,
  /// or “video/mp4”. Defaults to “image/jpeg”
  String? thumbnailMimeType;

  /// Optional.
  /// Title for the result
  String? title;

  /// Optional.
  /// Caption of the GIF file to be sent, 0-1024 characters after entities
  /// parsing
  String? caption;

  /// Optional.
  /// Mode for parsing entities in the caption.
  ParseMode? parseMode;

  /// Optional.
  /// List of special entities that appear in the caption,
  /// which can be specified instead of parse_mode
  List<MessageEntity>? captionEntities;

  /// Optional.
  /// Inline keyboard attached to the message
  InlineKeyboardMarkup? replyMarkup;

  /// Optional.
  /// Content of the message to be sent instead of the GIF animation
  InputMessageContent? inputMessageContent;

  /// Basic constructor
  InlineQueryResultGif({
    required this.id,
    required this.gifUrl,
    this.gifWidth,
    this.gifHeight,
    this.gifDuration,
    required this.thumbnailUrl,
    this.thumbnailMimeType,
    this.title,
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
      'gif_url': gifUrl,
      'gif_width': gifWidth,
      'gif_height': gifHeight,
      'gif_duration': gifDuration,
      'thumbnail_url': thumbnailUrl,
      'thumbnail_mime_type': thumbnailMimeType,
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
