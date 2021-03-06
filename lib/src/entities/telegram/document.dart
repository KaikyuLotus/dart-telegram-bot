import 'dart:convert';

import 'package:dart_telegram_bot/src/entities/internal/helpers/util.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';

class Document {
  String fileId;
  String fileUniqueId;
  PhotoSize? thumb;
  String? fileName;
  String? mimeType;
  int? fileSize;

  Document({
    required this.fileId,
    required this.fileUniqueId,
    this.thumb,
    this.fileName,
    this.mimeType,
    this.fileSize,
  });

  static Document fromJson(Map<String, dynamic> json) {
    return Document(
      fileId: json['file_id']!,
      fileUniqueId: json['file_unique_id']!,
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
      'thumb': thumb,
      'file_name': fileName,
      'mime_type': mimeType,
      'file_size': fileSize,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
