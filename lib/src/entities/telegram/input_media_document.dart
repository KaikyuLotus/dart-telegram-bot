part of '../../entities.dart';

class InputMediaDocument extends InputMedia {
  String type;
  String media;
  HttpFile thumb;
  String caption;
  ParseMode parseMode;

  InputMediaDocument({this.type, this.media, this.thumb, this.caption, this.parseMode});

  factory InputMediaDocument.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return InputMediaDocument(
        type: json['type'],
        media: json['media'],
        thumb: json['thumb'],
        caption: json['caption'],
        parseMode: json['parse_mode']);
  }

// TODO implement toJson

}
