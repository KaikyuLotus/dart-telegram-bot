import 'dart:convert';

import '../../../telegram_entities.dart';

class InputMediaAudio extends InputMedia {
  final String type = 'audio';
  String media;
  HttpFile? thumb;
  String? caption;
  ParseMode? parseMode;
  List<MessageEntity>? captionEntities;
  int? duration;
  String? performer;
  String? title;

  InputMediaAudio({
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
      'parse_mode': parseMode,
      'caption_entities': captionEntities,
      'duration': duration,
      'performer': performer,
      'title': title,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
