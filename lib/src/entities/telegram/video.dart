import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// This object represents a video file.
class Video {
  /// Identifier for this file, which can be used to download or reuse the file
  String fileId;

  /// Unique identifier for this file, which is supposed to be the same over
  /// time and for different bots. Can't be used to download or reuse the file.
  String fileUniqueId;

  /// Video width as defined by sender
  int width;

  /// Video height as defined by sender
  int height;

  /// Duration of the video in seconds as defined by sender
  int duration;

  /// Optional.
  /// Video thumbnail
  PhotoSize? thumbnail;

  /// Optional.
  /// Original filename as defined by sender
  String? fileName;

  /// Optional.
  /// MIME type of the file as defined by sender
  String? mimeType;

  /// Optional. File size in bytes.
  /// It can be bigger than 2^31 and some programming languages may have
  /// difficulty/silent defects in interpreting it.
  /// But it has at most 52 significant bits, so a signed 64-bit integer or
  /// double-precision float type are safe for storing this value.
  int? fileSize;

  /// Basic constructor
  Video({
    required this.fileId,
    required this.fileUniqueId,
    required this.width,
    required this.height,
    required this.duration,
    this.thumbnail,
    this.fileName,
    this.mimeType,
    this.fileSize,
  });

  /// Creates a object from a json
  static Video fromJson(Map<String, dynamic> json) {
    return Video(
      fileId: json['file_id']!,
      fileUniqueId: json['file_unique_id']!,
      width: json['width']!,
      height: json['height']!,
      duration: json['duration']!,
      thumbnail: callIfNotNull(PhotoSize.fromJson, json['thumbnail']),
      fileName: json['file_name'],
      mimeType: json['mime_type'],
      fileSize: json['file_size'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'file_id': fileId,
      'file_unique_id': fileUniqueId,
      'width': width,
      'height': height,
      'duration': duration,
      'thumbnail': thumbnail,
      'file_name': fileName,
      'mime_type': mimeType,
      'file_size': fileSize,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
