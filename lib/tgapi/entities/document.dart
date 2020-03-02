import 'package:dart_telegram_bot/tgapi/entities/photo_size.dart';

class Document {
  String fileId;
  String fileUniqueId;
  PhotoSize thumb;
  String fileName;
  String mimeType;
  int fileSize;

  Document({this.fileId, this.fileUniqueId, this.thumb, this.fileName, this.mimeType, this.fileSize});

  factory Document.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return Document(
        fileId: json['file_id'],
        fileUniqueId: json['file_unique_id'],
        thumb: PhotoSize.fromJson(json['thumb']),
        fileName: json['file_name'],
        mimeType: json['mime_type'],
        fileSize: json['file_size']);
  }
}
