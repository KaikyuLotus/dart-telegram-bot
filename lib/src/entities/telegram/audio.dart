import 'dart:convert';

import '../../../telegram_entities.dart';

import '../internal/helpers/util.dart';

class Audio {
  String fileId;
  String fileUniqueId;
  int duration;
  String? performer;
  String? title;
  String? fileName;
  String? mimeType;
  int? fileSize;
  PhotoSize? thumb;

  Audio({
    required this.fileId,
    required this.fileUniqueId,
    required this.duration,
    this.performer,
    this.title,
    this.fileName,
    this.mimeType,
    this.fileSize,
    this.thumb,
  });

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
      thumb: callIfNotNull(PhotoSize.fromJson, json['thumb']),
    );
  }

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
      'thumb': thumb,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
