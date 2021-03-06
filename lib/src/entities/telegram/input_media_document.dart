import 'dart:convert';

import 'package:dart_telegram_bot/dart_telegram_bot.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';

class InputMediaDocument extends InputMedia {
  String type;
  String media;
  HttpFile? thumb;
  String? caption;
  ParseMode? parseMode;
  List<MessageEntity>? captionEntities;
  bool? disableContentTypeDetection;

  InputMediaDocument({
    required this.type,
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
      'parse_mode': EnumHelper.encode(parseMode),
      'caption_entities': captionEntities,
      'disable_content_type_detection': disableContentTypeDetection,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
