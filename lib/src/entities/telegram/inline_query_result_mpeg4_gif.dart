import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents a link to a video animation (H.264/MPEG-4 AVC video without sound).
///
/// By default, this animated MPEG-4 file will be sent by the user with optional
/// caption.
///
/// Alternatively, you can use [inputMessageContent] to send a message with the
/// specified content instead of the animation.
class InlineQueryResultMpeg4Gif extends InlineQueryResult {
  /// Type of the result, must be *mpeg4_gif*
  @override
  String type = 'mpeg4_gif';

  /// Unique identifier for this result, 1-64 bytes
  @override
  String id;

  /// A valid URL for the MPEG4 file.
  ///
  /// File size must not exceed 1MB
  String mpeg4Url;

  /// Video width
  int? mpeg4Width;

  /// Video height
  int? mpeg4Height;

  /// Video duration in seconds
  int? mpeg4Duration;

  /// URL of the static (JPEG or GIF) or animated (MPEG4) thumbnail for the
  /// result
  String thumbnailUrl;

  /// MIME type of the thumbnail, must be one of “image/jpeg”, “image/gif”,
  /// or “video/mp4”. Defaults to “image/jpeg”
  String? thumbnailMimeType;

  /// Title for the result
  String? title;

  /// Caption of the MPEG-4 file to be sent, 0-1024 characters after entities
  /// parsing
  String? caption;

  /// Mode for parsing entities in the caption.
  ///
  /// See [formatting options](https://core.telegram.org/bots/api#formatting-options)
  /// for more details.
  ParseMode? parseMode;

  /// List of special entities that appear in the caption,
  /// which can be specified instead of [parseMode]
  List<MessageEntity>? captionEntities;

  /// `true`, if the caption must be shown above the message media
  bool? showCaptionAboveMedia;

  /// [Inline keyboard](https://core.telegram.org/bots/features#inline-keyboards)
  /// attached to the message
  InlineKeyboardMarkup? replyMarkup;

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
    this.showCaptionAboveMedia,
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
      'show_caption_above_media': showCaptionAboveMedia,
      'reply_markup': replyMarkup,
      'input_message_content': inputMessageContent,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
