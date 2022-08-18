import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents a link to a video file stored on the Telegram servers.
/// By default, this video file will be sent by the user with an optional
/// caption.
/// Alternatively, you can use input_message_content to send a message with the
/// specified content instead of the video.
class InlineQueryResultCachedVideo extends InlineQueryResult {
  /// Type of the result, must be video
  String type = 'video';

  /// Unique identifier for this result, 1-64 bytes
  String id;

  /// A valid file identifier for the video file
  String videoFileId;

  /// Title for the result
  String title;

  /// Optional.
  /// Short description of the result
  String? description;

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
  /// Inline keyboard attached to the message
  InlineKeyboardMarkup? replyMarkup;

  /// Optional.
  /// Content of the message to be sent instead of the video
  InputMessageContent? inputMessageContent;

  /// Basic constructor
  InlineQueryResultCachedVideo({
    required this.id,
    required this.videoFileId,
    required this.title,
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
      'video_file_id': videoFileId,
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
