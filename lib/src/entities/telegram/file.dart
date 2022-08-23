import 'dart:convert';

/// This object represents a file ready to be downloaded.
/// The file can be downloaded via the link
/// https://api.telegram.org/file/bot<token>/<file_path>.
/// It is guaranteed that the link will be valid for at least 1 hour.
/// When the link expires, a new one can be requested by calling getFile.
class File {
  /// Identifier for this file, which can be used to download or reuse the file
  String fileId;

  /// Unique identifier for this file, which is supposed to be the same over
  /// time and for different bots. Can't be used to download or reuse the file.
  String fileUniqueId;

  /// Optional.
  /// File size in bytes.
  /// It can be bigger than 2^31 and some programming languages may have
  /// difficulty/silent defects in interpreting it.
  /// But it has at most 52 significant bits, so a signed 64-bit integer or
  /// double-precision float type are safe for storing this value.
  int? fileSize;

  /// Optional.
  /// File path.
  /// Use https://api.telegram.org/file/bot<token>/<file_path> to get the file.
  String? filePath;

  /// Basic constructor
  File({
    required this.fileId,
    required this.fileUniqueId,
    this.fileSize,
    this.filePath,
  });

  /// Creates a object from a json
  static File fromJson(Map<String, dynamic> json) {
    return File(
      fileId: json['file_id']!,
      fileUniqueId: json['file_unique_id']!,
      fileSize: json['file_size'],
      filePath: json['file_path'],
    );
  }

  /// Creates a json from the object
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
