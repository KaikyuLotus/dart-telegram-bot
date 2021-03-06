import 'dart:convert';

class PassportFile {
  String fileId;
  String fileUniqueId;
  String fileSize;
  String fileDate;

  PassportFile({
    required this.fileId,
    required this.fileUniqueId,
    required this.fileSize,
    required this.fileDate,
  });

  static PassportFile fromJson(Map<String, dynamic> json) {
    return PassportFile(
      fileId: json['file_id']!,
      fileUniqueId: json['file_unique_id']!,
      fileSize: json['file_size']!,
      fileDate: json['file_date']!,
    );
  }

  static List<PassportFile> listFromJsonArray(List<dynamic> json) {
    return List.generate(
      json.length,
      (i) => PassportFile.fromJson(json[i]),
    );
  }

  Map toJson() {
    return {
      'file_id': fileId,
      'file_unique_id': fileUniqueId,
      'file_size': fileSize,
      'file_date': fileDate,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
