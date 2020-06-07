part of '../../entities.dart';

class Audio {
  String fileId;
  String fileUniqueId;
  int duration;
  String performer;
  String title;
  String mimeType;
  int fileSize;
  PhotoSize thumb;

  Audio(
      {this.fileId,
      this.fileUniqueId,
      this.duration,
      this.performer,
      this.title,
      this.mimeType,
      this.fileSize,
      this.thumb});

  factory Audio.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return Audio(
        fileId: json['file_id'],
        fileUniqueId: json['file_unique_id'],
        duration: json['duration'],
        performer: json['performer'],
        title: json['title'],
        mimeType: json['mime_type'],
        fileSize: json['file_size'],
        thumb: PhotoSize.fromJson(json['thumb']));
  }
}
