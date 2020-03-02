import 'package:dart_telegram_bot/tgapi/entities/photo_size.dart';

class Animation {
  String fileId;
  String fileUniqueId;
  int width;
  int height;
  int duration;
  PhotoSize thumb;
  String mimeType;
  int fileSize;

  Animation(
      {this.fileId,
      this.fileUniqueId,
      this.width,
      this.height,
      this.duration,
      this.thumb,
      this.mimeType,
      this.fileSize});

  factory Animation.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return Animation(
        fileId: json['file_id'],
        fileUniqueId: json['file_unique_id'],
        width: json['width'],
        height: json['height'],
        duration: json['duration'],
        thumb: PhotoSize.fromJson(json['thumb']),
        mimeType: json['mime_type'],
        fileSize: json['file_size']);
  }
}
