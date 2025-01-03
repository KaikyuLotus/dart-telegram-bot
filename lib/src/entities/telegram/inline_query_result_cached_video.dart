import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents a link to a video file stored on the Telegram servers.
///
/// By default, this video file will be sent by the user with an optional
/// caption.
///
/// Alternatively, you can use [inputMessageContent] to send a message with the
/// specified content instead of the video.
class InlineQueryResultCachedVideo extends InlineQueryResult {
  /// Type of the result, must be *video*
  @override
  String type = 'video';

  /// Unique identifier for this result, 1-64 bytes
  @override
  String id;

  /// A valid file identifier for the video file
  String videoFileId;

  /// Title for the result
  String title;

  /// Short description of the result
  String? description;

  /// Caption of the video to be sent, 0-1024 characters after entities parsing
  String? caption;

  /// Mode for parsing entities in the video caption.
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
    this.showCaptionAboveMedia,
    this.replyMarkup,
    this.inputMessageContent,
  });

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'id': id,
      'video_file_id': videoFileId,
      'title': title,
      'description': description,
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
