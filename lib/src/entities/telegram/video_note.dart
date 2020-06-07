part of '../../entities.dart';

class VideoNote {
  String fileId;
  String fileUniqueId;
  int length;
  int duration;
  PhotoSize thumb;
  int fileSize;

  VideoNote({this.fileId, this.fileUniqueId, this.length, this.duration, this.thumb, this.fileSize});

  factory VideoNote.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return VideoNote(
        fileId: json['file_id'],
        fileUniqueId: json['file_unique_id'],
        length: json['length'],
        duration: json['duration'],
        thumb: PhotoSize.fromJson(json['thumb']),
        fileSize: json['file_size']);
  }
}
