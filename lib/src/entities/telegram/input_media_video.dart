import 'dart:convert';

import '../../../telegram_entities.dart';

class InputMediaVideo extends InputMedia {
  final String type = 'video';
  String media;
  HttpFile? thumb;
  String? caption;
  ParseMode? parseMode;
  List<MessageEntity>? captionEntities;
  int? width;
  int? height;
  int? duration;
  bool? supportsStreaming;

  InputMediaVideo({
    required this.media,
    this.thumb,
    this.caption,
    this.parseMode,
    this.captionEntities,
    this.width,
    this.height,
    this.duration,
    this.supportsStreaming,
  });

  Map toJson() {
    return {
      'type': type,
      'media': media,
      'thumb': thumb,
      'caption': caption,
      'parse_mode': parseMode,
      'caption_entities': captionEntities,
      'width': width,
      'height': height,
      'duration': duration,
      'supports_streaming': supportsStreaming,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
