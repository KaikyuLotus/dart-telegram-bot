part of '../../entities.dart';

class Animation {
  String fileId;
  String fileUniqueId;
  int width;
  int height;
  int duration;
  PhotoSize thumb;
  String fileName;
  String mimeType;
  int fileSize;

  Animation(
      {this.fileId,
      this.fileUniqueId,
      this.width,
      this.height,
      this.duration,
      this.thumb,
      this.fileName,
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
        fileName: json['file_name'],
        mimeType: json['mime_type'],
        fileSize: json['file_size']);
  }
}
