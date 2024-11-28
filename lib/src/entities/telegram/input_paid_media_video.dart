import 'dart:convert';

import '../../../telegram_entities.dart';

/// The paid media to send is a video.
class InputPaidMediaVideo extends InputPaidMedia {
  /// Type of the media, must be video
  @override
  String type = 'video';

  /// File to send.
  ///
  /// Pass a file_id to send a file that exists on the Telegram servers
  /// (recommended), pass an HTTP URL for Telegram to get a file from the
  /// Internet, or pass “attach://<file_attach_name>” to upload a new one using
  /// multipart/form-data under <file_attach_name> name.
  ///
  /// [More information on Sending Files](https://core.telegram.org/bots/api#sending-files)
  @override
  String media;

  /// Thumbnail of the file sent; can be ignored if thumbnail generation for the
  /// file is supported server-side.
  ///
  /// The thumbnail should be in JPEG format and less than 200 kB in size.
  ///
  /// A thumbnail's width and height should not exceed 320.
  ///
  /// Ignored if the file is not uploaded using multipart/form-data.
  ///
  /// Thumbnails can't be reused and can be only uploaded as a new file, so you
  /// can pass “attach://<file_attach_name>” if the thumbnail was uploaded using
  /// multipart/form-data under <file_attach_name>.
  ///
  /// [More information on Sending Files](https://core.telegram.org/bots/api#sending-files)
  HttpFile? thumbnail;

  /// Video width
  int? width;

  /// Video height
  int? height;

  /// Video duration in seconds
  int? duration;

  /// Pass True if the uploaded video is suitable for streaming
  bool? supportsStreaming;

  /// Basic constructor
  InputPaidMediaVideo({
    required this.media,
    this.thumbnail,
    this.width,
    this.height,
    this.duration,
    this.supportsStreaming,
  });

  /// Creates an object from a json
  factory InputPaidMediaVideo.fromJson(Map<String, dynamic> json) {
    return InputPaidMediaVideo(
      media: json['media'],
      thumbnail: json['thumbnail'],
      width: json['width'],
      height: json['height'],
      duration: json['duration'],
      supportsStreaming: json['supports_streaming'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'type': type,
      'media': media,
      'thumbnail': thumbnail,
      'width': width,
      'height': height,
      'duration': duration,
      'supports_streaming': supportsStreaming,
    };
  }

  @override
  String toString() => json.encode(this);
}
