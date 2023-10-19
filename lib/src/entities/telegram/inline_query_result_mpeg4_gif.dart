import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents a link to a video animation
/// (H.264/MPEG-4 AVC video without sound).
/// By default, this animated MPEG-4 file will be sent by the user with optional
/// caption.
/// Alternatively, you can use input_message_content to send a message with the
/// specified content instead of the animation.
class InlineQueryResultMpeg4Gif extends InlineQueryResult {
  /// Type of the result, must be mpeg4_gif
  String type = 'mpeg4_gif';

  /// Unique identifier for this result, 1-64 bytes
  String id;

  /// A valid URL for the MPEG4 file. File size must not exceed 1MB
  String mpeg4Url;

  /// Optional.
  /// Video width
  int? mpeg4Width;

  /// Optional.
  /// Video height
  int? mpeg4Height;

  /// Optional.
  /// Video duration in seconds
  int? mpeg4Duration;

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
  /// Caption of the MPEG-4 file to be sent, 0-1024 characters after entities
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
  /// Content of the message to be sent instead of the video animation
  InputMessageContent? inputMessageContent;

  /// Basic constructor
  InlineQueryResultMpeg4Gif({
    required this.id,
    required this.mpeg4Url,
    this.mpeg4Width,
    this.mpeg4Height,
    this.mpeg4Duration,
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
      'mpeg4_url': mpeg4Url,
      'mpeg4_width': mpeg4Width,
      'mpeg4_height': mpeg4Height,
      'mpeg4_duration': mpeg4Duration,
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
