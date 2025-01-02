import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents a link to a photo.
///
/// By default, this photo will be sent by the user with optional caption.
///
/// Alternatively, you can use [inputMessageContent] to send a message with the
/// specified content instead of the photo.
class InlineQueryResultPhoto extends InlineQueryResult {
  /// Type of the result, must be *photo*
  @override
  String type = 'photo';

  /// Unique identifier for this result, 1-64 bytes
  @override
  String id;

  /// A valid URL of the photo. Photo must be in **JPEG** format.
  ///
  /// Photo size must not exceed 5MB
  String photoUrl;

  /// URL of the thumbnail for the photo
  String thumbnailUrl;

  /// Width of the photo
  int? photoWidth;

  /// Height of the photo
  int? photoHeight;

  /// Title for the result
  String? title;

  /// Short description of the result
  String? description;

  /// Caption of the photo to be sent, 0-1024 characters after entities parsing
  String? caption;

  /// Mode for parsing entities in the photo caption.
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

  /// Content of the message to be sent instead of the photo
  InputMessageContent? inputMessageContent;

  /// Basic constructor
  InlineQueryResultPhoto({
    required this.id,
    required this.photoUrl,
    required this.thumbnailUrl,
    this.photoWidth,
    this.photoHeight,
    this.title,
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
      'photo_url': photoUrl,
      'thumbnail_url': thumbnailUrl,
      'photo_width': photoWidth,
      'photo_height': photoHeight,
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
