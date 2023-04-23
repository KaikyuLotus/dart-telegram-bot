import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// This object represents a video message
/// (available in Telegram apps as of v.4.0).
class VideoNote {
  /// Identifier for this file, which can be used to download or reuse the file
  String fileId;

  /// Unique identifier for this file, which is supposed to be the same over
  /// time and for different bots. Can't be used to download or reuse the file.
  String fileUniqueId;

  /// Video width and height (diameter of the video message) as defined by
  /// sender
  int length;

  /// Duration of the video in seconds as defined by sender
  int duration;

  /// Optional.
  /// Video thumbnail
  PhotoSize? thumbnail;

  /// Optional.
  /// File size in bytes
  int? fileSize;

  /// Basic constructor
  VideoNote({
    required this.fileId,
    required this.fileUniqueId,
    required this.length,
    required this.duration,
    this.thumbnail,
    this.fileSize,
  });

  /// Creates a object from a json
  static VideoNote fromJson(Map<String, dynamic> json) {
    return VideoNote(
      fileId: json['file_id']!,
      fileUniqueId: json['file_unique_id']!,
      length: json['length']!,
      duration: json['duration']!,
      thumbnail: callIfNotNull(PhotoSize.fromJson, json['thumbnail']),
      fileSize: json['file_size'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'file_id': fileId,
      'file_unique_id': fileUniqueId,
      'length': length,
      'duration': duration,
      'thumbnail': thumbnail,
      'file_size': fileSize,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
