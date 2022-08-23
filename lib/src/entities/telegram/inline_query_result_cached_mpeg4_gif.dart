import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents a link to a video animation
/// (H.264/MPEG-4 AVC video without sound) stored on the Telegram servers.
/// By default, this animated MPEG-4 file will be sent by the user with an
/// optional caption.
/// Alternatively, you can use input_message_content to send a message with the
/// specified content instead of the animation.
class InlineQueryResultCachedMpeg4Gif extends InlineQueryResult {
  /// Type of the result, must be mpeg4_gif
  String type = 'mpeg4_gif';

  /// Unique identifier for this result, 1-64 bytes
  String id;

  /// A valid file identifier for the MPEG4 file
  String mpeg4FileId;

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
  InlineQueryResultCachedMpeg4Gif({
    required this.id,
    required this.mpeg4FileId,
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
      'mpeg4_file_id': mpeg4FileId,
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
