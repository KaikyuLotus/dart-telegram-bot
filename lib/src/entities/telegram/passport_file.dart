import 'dart:convert';

/// This object represents a file uploaded to Telegram Passport.
/// Currently all Telegram Passport files are in JPEG format when decrypted
/// and don't exceed 10MB.
class PassportFile {
  /// Identifier for this file, which can be used to download or reuse the file
  String fileId;

  /// Unique identifier for this file, which is supposed to be the same over
  /// time and for different bots. Can't be used to download or reuse the file.
  String fileUniqueId;

  /// File size in bytes
  String fileSize;

  /// Unix time when the file was uploaded
  String fileDate;

  /// Basic constructor
  PassportFile({
    required this.fileId,
    required this.fileUniqueId,
    required this.fileSize,
    required this.fileDate,
  });

  /// Creates a object from a json
  static PassportFile fromJson(Map<String, dynamic> json) {
    return PassportFile(
      fileId: json['file_id']!,
      fileUniqueId: json['file_unique_id']!,
      fileSize: json['file_size']!,
      fileDate: json['file_date']!,
    );
  }

  /// Creates a list of object from a json array
  static List<PassportFile> listFromJsonArray(List<dynamic> json) {
    return List.generate(
      json.length,
      (i) => PassportFile.fromJson(json[i]),
    );
  }

  /// Creates a json from the object
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
