import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents a video to be sent.
class InputMediaVideo extends InputMedia {
  /// Type of the result, must be video
  @override
  final String type = 'video';

  /// File to send.
  /// Pass a file_id to send a file that exists on the Telegram servers
  /// (recommended), pass an HTTP URL for Telegram to get a file from the
  /// Internet, or pass “attach://<file_attach_name>” to upload a new one using
  /// multipart/form-data under <file_attach_name> name.
  @override
  dynamic media;

  /// Optional.
  /// Thumbnail of the file sent; can be ignored if thumbnail generation for the
  /// file is supported server-side. The thumbnail should be in JPEG format and
  /// less than 200 kB in size. A thumbnail's width and height should not exceed
  /// 320.
  /// Ignored if the file is not uploaded using multipart/form-data.
  /// Thumbnails can't be reused and can be only uploaded as a new file,
  /// so you can pass “attach://<file_attach_name>” if the thumbnail was
  /// uploaded using multipart/form-data under <file_attach_name>.
  HttpFile? thumbnail;

  /// Optional.
  /// Caption of the video to be sent, 0-1024 characters after entities parsing
  String? caption;

  /// Optional.
  /// Mode for parsing entities in the video caption.
  ParseMode? parseMode;

  /// Optional.
  /// List of special entities that appear in the caption, which can be
  /// specified instead of parse_mode
  List<MessageEntity>? captionEntities;

  /// Optional.
  /// True, if the caption must be shown above the message media
  bool? showCaptionAboveMedia;

  /// Optional.
  /// Video width
  int? width;

  /// Optional.
  /// Video height
  int? height;

  /// Optional.
  /// Video duration in seconds
  int? duration;

  /// Optional.
  /// Pass True if the uploaded video is suitable for streaming
  bool? supportsStreaming;

  /// Optional.
  /// Pass True if the video needs to be covered with a spoiler animation
  bool? hasSpoiler;

  /// Basic constructor
  InputMediaVideo({
    required this.media,
    this.thumbnail,
    this.caption,
    this.parseMode,
    this.captionEntities,
    this.showCaptionAboveMedia,
    this.width,
    this.height,
    this.duration,
    this.supportsStreaming,
    this.hasSpoiler,
  });

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'media': media,
      'thumbnail': thumbnail,
      'caption': caption,
      'parse_mode': parseMode,
      'caption_entities': captionEntities,
      'show_caption_above_media': showCaptionAboveMedia,
      'width': width,
      'height': height,
      'duration': duration,
      'supports_streaming': supportsStreaming,
      'has_spoiler': hasSpoiler,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
