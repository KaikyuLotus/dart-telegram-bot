import 'input_media.dart';
import 'internal/http_file.dart';

class InputMediaAnimation extends InputMedia {
  String type;
  String media; // TODO not implemented
  HttpFile thumb;
  String caption;
  String parseMode;
  int width;
  int height;
  int duration;

  InputMediaAnimation(
      {this.type, this.media, this.thumb, this.caption, this.parseMode, this.width, this.height, this.duration});

  factory InputMediaAnimation.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return InputMediaAnimation(
        type: json['type'],
        media: json['media'],
        thumb: json['thumb'],
        caption: json['caption'],
        parseMode: json['parse_mode'],
        width: json['width'],
        height: json['height'],
        duration: json['duration']);
  }
}
