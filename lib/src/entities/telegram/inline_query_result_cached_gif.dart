import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents a link to an animated GIF file stored on the Telegram servers.
/// By default, this animated GIF file will be sent by the user with an optional
/// caption.
/// Alternatively, you can use input_message_content to send a message with
///specified content instead of the animation.
class InlineQueryResultCachedGif extends InlineQueryResult {
  /// Type of the result, must be gif
  String type = 'gif';

  /// Unique identifier for this result, 1-64 bytes
  String id;

  /// A valid file identifier for the GIF file
  String gifFileId;

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
  InlineQueryResultCachedGif({
    required this.id,
    required this.gifFileId,
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
      'gif_file_id': gifFileId,
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
