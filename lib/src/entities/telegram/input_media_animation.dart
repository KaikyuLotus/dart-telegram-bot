import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents an animation file (GIF or H.264/MPEG-4 AVC video without sound)
/// to be sent.
class InputMediaAnimation extends InputMedia {
  /// Type of the result, must be animation
  final String type = 'animation';

  /// File to send.
  /// Pass a file_id to send a file that exists on the Telegram servers
  /// (recommended), pass an HTTP URL for Telegram to get a file from the
  /// Internet, or pass “attach://<file_attach_name>” to upload a new one using
  /// multipart/form-data under <file_attach_name> name.
  String media;

  /// Optional.
  /// Thumbnail of the file sent; can be ignored if thumbnail generation for the
  /// file is supported server-side. The thumbnail should be in JPEG format and
  /// less than 200 kB in size. A thumbnail's width and height should not exceed
  /// 320.
  /// Ignored if the file is not uploaded using multipart/form-data.
  /// Thumbnails can't be reused and can be only uploaded as a new file, so you
  /// can pass “attach://<file_attach_name>” if the thumbnail was uploaded using
  /// multipart/form-data under <file_attach_name>.
  HttpFile? thumbnail;

  /// Optional.
  /// Caption of the animation to be sent, 0-1024 characters after entities
  /// parsing
  String? caption;

  /// Optional.
  /// Mode for parsing entities in the animation caption.
  ParseMode? parseMode;

  /// Optional.
  /// List of special entities that appear in the caption, which can be
  /// specified instead of parse_mode
  List<MessageEntity>? captionEntities;

  /// Optional.
  /// Animation width
  int? width;

  /// Optional.
  /// Animation height
  int? height;

  /// Optional.
  /// Animation duration in seconds
  int? duration;

  /// Basic constructor
  InputMediaAnimation({
    required this.media,
    this.thumbnail,
    this.caption,
    this.parseMode,
    this.captionEntities,
    this.width,
    this.height,
    this.duration,
  });

  /// Creates a json from the object
  Map toJson() {
    return {
      'type': type,
      'media': media,
      'thumbnail': thumbnail,
      'caption': caption,
      'parse_mode': parseMode,
      'caption_entities': captionEntities,
      'width': width,
      'height': height,
      'duration': duration,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
