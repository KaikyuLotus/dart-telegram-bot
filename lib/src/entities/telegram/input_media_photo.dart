import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents a photo to be sent.
class InputMediaPhoto extends InputMedia {
  /// Type of the result, must be photo
  @override
  final String type = 'photo';

  /// File to send.
  /// Pass a file_id to send a file that exists on the Telegram servers
  /// (recommended), pass an HTTP URL for Telegram to get a file from the
  /// Internet, or pass “attach://<file_attach_name>”
  /// to upload a new one using multipart/form-data under <file_attach_name> name.
  @override
  dynamic media;

  /// Optional.
  /// Caption of the photo to be sent, 0-1024 characters after entities parsing
  String? caption;

  /// Optional.
  /// Mode for parsing entities in the photo caption.
  ParseMode? parseMode;

  /// Optional.
  /// List of special entities that appear in the caption,
  /// which can be specified instead of parse_mode
  List<MessageEntity>? captionEntities;

  /// Optional.
  /// True, if the caption must be shown above the message media
  bool? showCaptionAboveMedia;

  /// Optional.
  /// Pass True if the photo needs to be covered with a spoiler animation
  bool? hasSpoiler;

  /// Basic constructor
  InputMediaPhoto({
    required this.media,
    this.caption,
    this.parseMode,
    this.captionEntities,
    this.showCaptionAboveMedia,
    this.hasSpoiler,
  });

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'media': media,
      'caption': caption,
      'parse_mode': parseMode,
      'caption_entities': captionEntities,
      'show_caption_above_media': showCaptionAboveMedia,
      'has_spoiler': hasSpoiler,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
