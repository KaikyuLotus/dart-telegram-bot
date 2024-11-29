import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents a link to an MP3 audio file.
///
/// By default, this audio file will be sent by the user.
///
/// Alternatively, you can use [inputMessageContent] to send a message with the
/// specified content instead of the audio.
class InlineQueryResultAudio extends InlineQueryResult {
  /// Type of the result, must be *audio*
  @override
  String type = 'audio';

  /// Unique identifier for this result, 1-64 bytes
  @override
  String id;

  /// A valid URL for the audio file
  String audioUrl;

  /// Title
  String title;

  /// Caption, 0-1024 characters after entities parsing
  String? caption;

  /// Mode for parsing entities in the audio caption.
  ///
  /// See [formatting options](https://core.telegram.org/bots/api#formatting-options)
  /// for more details.
  ParseMode? parseMode;

  /// List of special entities that appear in the caption, which can be
  /// specified instead of [parseMode]
  List<MessageEntity>? captionEntities;

  /// Performer
  String? performer;

  /// Audio duration in seconds
  int? audioDuration;

  /// [Inline keyboard](https://core.telegram.org/bots/features#inline-keyboards)
  /// attached to the message
  InlineKeyboardMarkup? replyMarkup;

  /// Content of the message to be sent instead of the audio
  InputMessageContent? inputMessageContent;

  /// Basic constructor
  InlineQueryResultAudio({
    required this.id,
    required this.audioUrl,
    required this.title,
    this.caption,
    this.parseMode,
    this.captionEntities,
    this.performer,
    this.audioDuration,
    this.replyMarkup,
    this.inputMessageContent,
  });

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'id': id,
      'audio_url': audioUrl,
      'title': title,
      'caption': caption,
      'parse_mode': parseMode,
      'caption_entities': captionEntities,
      'performer': performer,
      'audio_duration': audioDuration,
      'reply_markup': replyMarkup,
      'input_message_content': inputMessageContent,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
