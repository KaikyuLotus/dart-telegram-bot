import 'input_media.dart';
import 'internal/http_file.dart';

class InputMediaVideo extends InputMedia {
  String type;
  String media;
  HttpFile thumb;
  String caption;
  String parseMode;
  int width;
  int height;
  int duration;
  bool supportsStreaming;

  InputMediaVideo(
      {this.type,
      this.media,
      this.thumb,
      this.caption,
      this.parseMode,
      this.width,
      this.height,
      this.duration,
      this.supportsStreaming});

  factory InputMediaVideo.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return InputMediaVideo(
        type: json['type'],
        media: json['media'],
        thumb: json['thumb'],
        caption: json['caption'],
        parseMode: json['parse_mode'],
        width: json['width'],
        height: json['height'],
        duration: json['duration'],
        supportsStreaming: json['supports_streaming']);
  }
}
