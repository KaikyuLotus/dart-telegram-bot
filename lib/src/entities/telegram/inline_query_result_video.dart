import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents a link to a page containing an embedded video player or a video
/// file. By default, this video file will be sent by the user with an optional
/// caption.
/// Alternatively, you can use input_message_content to send a message with the
/// specified content instead of the video.
class InlineQueryResultVideo extends InlineQueryResult {
  /// Type of the result, must be video
  String type = 'video';

  /// Unique identifier for this result, 1-64 bytes
  String id;

  /// A valid URL for the embedded video player or video file
  String videoUrl;

  /// MIME type of the content of the video URL, “text/html” or “video/mp4”
  String mimeType;

  /// URL of the thumbnail (JPEG only) for the video
  String thumbnailUrl;

  /// Title for the result
  String title;

  /// Optional.
  /// Caption of the video to be sent, 0-1024 characters after entities parsing
  String? caption;

  /// Optional.
  /// Mode for parsing entities in the video caption.
  ParseMode? parseMode;

  /// Optional.
  /// List of special entities that appear in the caption,
  /// which can be specified instead of parse_mode
  List<MessageEntity>? captionEntities;

  /// Optional.
  /// Video width
  int? videoWidth;

  /// Optional.
  /// Video height
  int? videoHeight;

  /// Optional.
  /// Video duration in seconds
  int? videoDuration;

  /// Optional.
  /// Short description of the result
  String? description;

  /// Optional.
  /// Inline keyboard attached to the message
  InlineKeyboardMarkup? replyMarkup;

  /// Optional.
  /// Content of the message to be sent instead of the video.
  /// This field is required if InlineQueryResultVideo is used to send an
  /// HTML-page as a result (e.g., a YouTube video).
  InputMessageContent? inputMessageContent;

  /// Basic constructor
  InlineQueryResultVideo({
    required this.id,
    required this.videoUrl,
    required this.mimeType,
    required this.thumbnailUrl,
    required this.title,
    this.caption,
    this.parseMode,
    this.captionEntities,
    this.videoWidth,
    this.videoHeight,
    this.videoDuration,
    this.description,
    this.replyMarkup,
    this.inputMessageContent,
  });

  /// Creates a json from the object
  Map toJson() {
    return {
      'type': type,
      'id': id,
      'video_url': videoUrl,
      'mime_type': mimeType,
      'thumbnail_url': thumbnailUrl,
      'title': title,
      'caption': caption,
      'parse_mode': parseMode,
      'caption_entities': captionEntities,
      'video_width': videoWidth,
      'video_height': videoHeight,
      'video_duration': videoDuration,
      'description': description,
      'reply_markup': replyMarkup,
      'input_message_content': inputMessageContent,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
