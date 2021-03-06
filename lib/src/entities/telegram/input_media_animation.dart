import 'dart:convert';

import 'package:dart_telegram_bot/dart_telegram_bot.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';

class InputMediaAnimation extends InputMedia {
  String type;
  String media;
  HttpFile? thumb;
  String? caption;
  String? parseMode;
  List<MessageEntity>? captionEntities;
  int? width;
  int? height;
  int? duration;

  InputMediaAnimation({
    required this.type,
    required this.media,
    this.thumb,
    this.caption,
    this.parseMode,
    this.captionEntities,
    this.width,
    this.height,
    this.duration,
  });

  Map toJson() {
    return {
      'type': type,
      'media': media,
      'thumb': thumb,
      'caption': caption,
      'parse_mode': EnumHelper.encode(parseMode),
      'caption_entities': captionEntities,
      'width': width,
      'height': height,
      'duration': duration,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
