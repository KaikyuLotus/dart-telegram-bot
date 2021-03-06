import 'dart:convert';

import 'package:dart_telegram_bot/src/entities/internal/helpers/util.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';

class Animation {
  String fileId;
  String fileUniqueId;
  int width;
  int height;
  int duration;
  PhotoSize? thumb;
  String? fileName;
  String? mimeType;
  int? fileSize;

  Animation({
    required this.fileId,
    required this.fileUniqueId,
    required this.width,
    required this.height,
    required this.duration,
    this.thumb,
    this.fileName,
    this.mimeType,
    this.fileSize,
  });

  static Animation fromJson(Map<String, dynamic> json) {
    return Animation(
      fileId: json['file_id']!,
      fileUniqueId: json['file_unique_id']!,
      width: json['width']!,
      height: json['height']!,
      duration: json['duration']!,
      thumb: callIfNotNull(PhotoSize.fromJson, json['thumb']),
      fileName: json['file_name'],
      mimeType: json['mime_type'],
      fileSize: json['file_size'],
    );
  }

  Map toJson() {
    return {
      'file_id': fileId,
      'file_unique_id': fileUniqueId,
      'width': width,
      'height': height,
      'duration': duration,
      'thumb': thumb,
      'file_name': fileName,
      'mime_type': mimeType,
      'file_size': fileSize,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
