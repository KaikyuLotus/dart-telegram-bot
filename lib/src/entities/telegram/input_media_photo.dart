import 'dart:convert';

import '../../../telegram_entities.dart';

class InputMediaPhoto extends InputMedia {
  final String type = 'photo';
  String media;
  String? caption;
  ParseMode? parseMode;
  List<MessageEntity>? captionEntities;

  InputMediaPhoto({
    required this.media,
    this.caption,
    this.parseMode,
    this.captionEntities,
  });

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'media': media,
      'caption': caption,
      'parse_mode': parseMode,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
