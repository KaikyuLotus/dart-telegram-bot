import '../enums/parse_mode.dart';

import 'input_media.dart';

class InputMediaPhoto extends InputMedia {
  String type;
  String media;
  String caption;
  ParseMode parseMode;

  InputMediaPhoto({this.type, this.media, this.caption, this.parseMode});

  factory InputMediaPhoto.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return InputMediaPhoto(
        type: json['type'],
        media: json['media'],
        caption: json['caption'],
        parseMode: ParseMode.fromString(json['parse_mode']));
  }
}
