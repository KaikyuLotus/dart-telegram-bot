import 'dart:convert';

class File {
  String fileId;
  String fileUniqueId;
  int? fileSize;
  String? filePath;

  File({
    required this.fileId,
    required this.fileUniqueId,
    this.fileSize,
    this.filePath,
  });

  static File fromJson(Map<String, dynamic> json) {
    return File(
      fileId: json['file_id']!,
      fileUniqueId: json['file_unique_id']!,
      fileSize: json['file_size'],
      filePath: json['file_path'],
    );
  }

  Map toJson() {
    return {
      'file_id': fileId,
      'file_unique_id': fileUniqueId,
      'file_size': fileSize,
      'file_path': filePath,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
