import 'package:dart_telegram_bot/telegram_entities.dart';

class Video {
  String fileId;
  String fileUniqueId;
  int width;
  int height;
  int duration;
  PhotoSize thumb;
  String mimeType;
  int fileSize;

  Video({
    this.fileId,
    this.fileUniqueId,
    this.width,
    this.height,
    this.duration,
    this.thumb,
    this.mimeType,
    this.fileSize,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return Video(
      fileId: json['file_id'],
      fileUniqueId: json['file_unique_id'],
      width: json['width'],
      height: json['height'],
      duration: json['duration'],
      thumb: PhotoSize.fromJson(json['thumb']),
      mimeType: json['mime_type'],
      fileSize: json['file_size'],
    );
  }
}
