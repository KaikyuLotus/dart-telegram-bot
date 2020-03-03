import 'input_media.dart';
import 'internal/http_file.dart';

class InputMediaAudio extends InputMedia {
  String type;
  String media;
  HttpFile thumb;
  String caption;
  String parseMode;
  int duration;
  String performer;
  String title;

  InputMediaAudio(
      {this.type, this.media, this.thumb, this.caption, this.parseMode, this.duration, this.performer, this.title});

  factory InputMediaAudio.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return InputMediaAudio(
        type: json['type'],
        media: json['media'],
        thumb: json['thumb'],
        caption: json['caption'],
        parseMode: json['parse_mode'],
        duration: json['duration'],
        performer: json['performer'],
        title: json['title']);
  }
}
