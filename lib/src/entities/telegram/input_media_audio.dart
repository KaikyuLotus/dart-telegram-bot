import 'dart:convert';

import 'package:dart_telegram_bot/dart_telegram_bot.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';

class InputMediaAudio extends InputMedia {
  String type;
  String media;
  HttpFile? thumb;
  String? caption;
  String? parseMode;
  List<MessageEntity>? captionEntities;
  int? duration;
  String? performer;
  String? title;

  InputMediaAudio({
    required this.type,
    required this.media,
    this.thumb,
    this.caption,
    this.parseMode,
    this.captionEntities,
    this.duration,
    this.performer,
    this.title,
  });

  Map toJson() {
    return {
      'type': type,
      'media': media,
      'thumb': thumb,
      'caption': caption,
      'parse_mode': EnumHelper.encode(parseMode),
      'caption_entities': captionEntities,
      'duration': duration,
      'performer': performer,
      'title': title,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
