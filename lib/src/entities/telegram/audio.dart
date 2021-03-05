import 'package:dart_telegram_bot/src/entities/internal/helpers/util.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';

class Audio {
  String fileId;
  String fileUniqueId;
  int duration;
  String? performer;
  String? title;
  String? mimeType;
  int? fileSize;
  PhotoSize? thumb;

  Audio({
    required this.fileId,
    required this.fileUniqueId,
    required this.duration,
    this.performer,
    this.title,
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
      mimeType: json['mime_type'],
      fileSize: json['file_size'],
      thumb: callIfNotNull(PhotoSize.fromJson, json['thumb']),
    );
  }
}
