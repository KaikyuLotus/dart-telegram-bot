import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents a link to a voice recording in an .OGG container encoded with
/// OPUS.
/// By default, this voice recording will be sent by the user.
/// Alternatively, you can use input_message_content to send a message with the
/// specified content instead of the the voice message.
class InlineQueryResultVoice extends InlineQueryResult {
  /// Type of the result, must be voice
  String type = 'voice';

  /// Unique identifier for this result, 1-64 bytes
  String id;

  /// A valid URL for the voice recording
  String voiceUrl;

  /// Recording title
  String title;

  /// Optional.
  /// Caption, 0-1024 characters after entities parsing
  String? caption;

  /// Optional.
  /// Mode for parsing entities in the voice message caption.
  ParseMode? parseMode;

  /// Optional.
  /// List of special entities that appear in the caption, which can be
  /// specified instead of parse_mode
  List<MessageEntity>? captionEntities;

  /// Optional.
  /// Recording duration in seconds
  int? voiceDuration;

  /// Optional.
  /// Inline keyboard attached to the message
  InlineKeyboardMarkup? replyMarkup;

  /// Optional.
  /// Content of the message to be sent instead of the voice recording
  InputMessageContent? inputMessageContent;

  /// Basic constructor
  InlineQueryResultVoice({
    required this.id,
    required this.voiceUrl,
    required this.title,
    this.caption,
    this.parseMode,
    this.captionEntities,
    this.voiceDuration,
    this.replyMarkup,
    this.inputMessageContent,
  });

  /// Creates a json from the object
  Map toJson() {
    return {
      'type': type,
      'id': id,
      'voice_url': voiceUrl,
      'title': title,
      'caption': caption,
      'parse_mode': parseMode,
      'caption_entities': captionEntities,
      'voice_duration': voiceDuration,
      'reply_markup': replyMarkup,
      'input_message_content': inputMessageContent,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
