import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents a link to a voice message stored on the Telegram servers.
/// By default, this voice message will be sent by the user.
/// Alternatively, you can use input_message_content to send a message with the
/// specified content instead of the voice message.
class InlineQueryResultCachedVoice extends InlineQueryResult {
  /// Type of the result, must be voice
  String type = 'voice';

  /// Unique identifier for this result, 1-64 bytes
  String id;

  /// A valid file identifier for the voice message
  String voiceFileId;

  /// Voice message title
  String title;

  /// Optional.
  /// Caption, 0-1024 characters after entities parsing
  String? caption;

  /// Optional.
  /// Mode for parsing entities in the voice message caption.
  ParseMode? parseMode;

  /// Optional.
  /// List of special entities that appear in the caption,
  /// which can be specified instead of parse_mode
  List<MessageEntity>? captionEntities;

  /// Optional.
  /// Inline keyboard attached to the message
  InlineKeyboardMarkup? replyMarkup;

  /// Optional.
  /// Content of the message to be sent instead of the voice message
  InputMessageContent? inputMessageContent;

  /// Basic constructor
  InlineQueryResultCachedVoice({
    required this.id,
    required this.voiceFileId,
    required this.title,
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
      'voice_file_id': voiceFileId,
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
