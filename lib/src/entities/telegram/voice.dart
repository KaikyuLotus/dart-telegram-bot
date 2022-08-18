import 'dart:convert';

/// This object represents a voice note.
class Voice {
  /// Identifier for this file, which can be used to download or reuse the file
  String fileId;

  /// Unique identifier for this file, which is supposed to be the same over
  /// time and for different bots. Can't be used to download or reuse the file.
  String fileUniqueId;

  /// Duration of the audio in seconds as defined by sender
  int duration;

  /// Optional.
  /// MIME type of the file as defined by sender
  String? mimeType;

  /// Optional.
  /// File size in bytes.
  /// It can be bigger than 2^31 and some programming languages may have
  /// difficulty/silent defects in interpreting it.
  /// But it has at most 52 significant bits, so a signed 64-bit integer or
  /// double-precision float type are safe for storing this value.
  int? fileSize;

  /// Basic constructor
  Voice({
    required this.fileId,
    required this.fileUniqueId,
    required this.duration,
    this.mimeType,
    this.fileSize,
  });

  /// Creates a object from a json
  static Voice fromJson(Map<String, dynamic> json) {
    return Voice(
      fileId: json['file_id']!,
      fileUniqueId: json['file_unique_id']!,
      duration: json['duration']!,
      mimeType: json['mime_type'],
      fileSize: json['file_size'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'file_id': fileId,
      'file_unique_id': fileUniqueId,
      'duration': duration,
      'mime_type': mimeType,
      'file_size': fileSize,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
