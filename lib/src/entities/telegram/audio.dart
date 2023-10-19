import 'dart:convert';

import '../../../telegram_entities.dart';

import '../internal/helpers/util.dart';

/// This object represents an audio file to be treated as music by the
/// Telegram clients.
class Audio {
  /// Identifier for this file, which can be used to download or reuse the file
  String fileId;

  /// Unique identifier for this file, which is supposed to be the same over
  /// time and for different bots. Can't be used to download or reuse the file.
  String fileUniqueId;

  /// Duration of the audio in seconds as defined by sender
  int duration;

  /// Optional.
  /// Performer of the audio as defined by sender or by audio tags
  String? performer;

  /// Optional.
  /// Title of the audio as defined by sender or by audio tags
  String? title;

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

  /// Optional.
  /// Thumbnail of the album cover to which the music file belongs
  PhotoSize? thumbnail;

  /// Basic constructor
  Audio({
    required this.fileId,
    required this.fileUniqueId,
    required this.duration,
    this.performer,
    this.title,
    this.fileName,
    this.mimeType,
    this.fileSize,
    this.thumbnail,
  });

  /// Creates a object from a json
  static Audio fromJson(Map<String, dynamic> json) {
    return Audio(
      fileId: json['file_id']!,
      fileUniqueId: json['file_unique_id']!,
      duration: json['duration']!,
      performer: json['performer'],
      title: json['title'],
      fileName: json['file_name'],
      mimeType: json['mime_type'],
      fileSize: json['file_size'],
      thumbnail: callIfNotNull(PhotoSize.fromJson, json['thumbnail']),
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'file_id': fileId,
      'file_unique_id': fileUniqueId,
      'duration': duration,
      'performer': performer,
      'title': title,
      'file_name': fileName,
      'mime_type': mimeType,
      'file_size': fileSize,
      'thumbnail': thumbnail,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
