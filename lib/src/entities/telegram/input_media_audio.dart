import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents an audio file to be treated as music to be sent.
class InputMediaAudio extends InputMedia {
  /// Type of the result, must be audio
  final String type = 'audio';

  /// File to send.
  /// Pass a file_id to send a file that exists on the Telegram servers
  /// (recommended), pass an HTTP URL for Telegram to get a file from the
  /// Internet, or pass “attach://<file_attach_name>” to upload a new one using
  /// multipart/form-data under <file_attach_name> name.
  String media;

  /// Optional.
  /// Thumbnail of the file sent; can be ignored if thumbnail generation for the
  /// file is supported server-side.
  /// The thumbnail should be in JPEG format and less than 200 kB in size.
  /// A thumbnail's width and height should not exceed 320.
  /// Ignored if the file is not uploaded using multipart/form-data.
  /// Thumbnails can't be reused and can be only uploaded as a new file,
  /// so you can pass “attach://<file_attach_name>” if the thumbnail was
  /// uploaded using multipart/form-data under <file_attach_name>.
  HttpFile? thumbnail;

  /// Optional.
  /// Caption of the audio to be sent, 0-1024 characters after entities parsing
  String? caption;

  /// Optional.
  /// Mode for parsing entities in the audio caption.
  ParseMode? parseMode;

  /// Optional.
  /// List of special entities that appear in the caption, which can be
  /// specified instead of parse_mode
  List<MessageEntity>? captionEntities;

  /// Optional.
  /// Duration of the audio in seconds
  int? duration;

  /// Optional.
  /// Performer of the audio
  String? performer;

  /// Optional.
  /// Title of the audio
  String? title;

  /// Basic constructor
  InputMediaAudio({
    required this.media,
    this.thumbnail,
    this.caption,
    this.parseMode,
    this.captionEntities,
    this.duration,
    this.performer,
    this.title,
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
      'duration': duration,
      'performer': performer,
      'title': title,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
