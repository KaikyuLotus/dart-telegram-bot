import 'dart:convert';

import 'package:dart_telegram_bot/src/entities/internal/helpers/util.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';

class VideoNote {
  String fileId;
  String fileUniqueId;
  int length;
  int duration;
  PhotoSize? thumb;
  int? fileSize;

  VideoNote({
    required this.fileId,
    required this.fileUniqueId,
    required this.length,
    required this.duration,
    this.thumb,
    this.fileSize,
  });

  static VideoNote fromJson(Map<String, dynamic> json) {
    return VideoNote(
      fileId: json['file_id']!,
      fileUniqueId: json['file_unique_id']!,
      length: json['length']!,
      duration: json['duration']!,
      thumb: callIfNotNull(PhotoSize.fromJson, json['thumb']),
      fileSize: json['file_size'],
    );
  }

  Map toJson() {
    return {
      'file_id': fileId,
      'file_unique_id': fileUniqueId,
      'length': length,
      'duration': duration,
      'thumb': thumb,
      'file_size': fileSize,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
