import 'dart:convert';

import '../../../telegram_entities.dart';

class InputMediaDocument extends InputMedia {
  final String type = 'document';
  String media;
  HttpFile? thumb;
  String? caption;
  ParseMode? parseMode;
  List<MessageEntity>? captionEntities;
  bool? disableContentTypeDetection;

  InputMediaDocument({
    required this.media,
    this.thumb,
    this.caption,
    this.parseMode,
    this.captionEntities,
    this.disableContentTypeDetection,
  });

  Map toJson() {
    return {
      'type': type,
      'media': media,
      'thumb': thumb,
      'caption': caption,
      'parse_mode': parseMode,
      'caption_entities': captionEntities,
      'disable_content_type_detection': disableContentTypeDetection,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
