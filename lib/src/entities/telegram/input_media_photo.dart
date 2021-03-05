import 'package:dart_telegram_bot/telegram_entities.dart';

class InputMediaPhoto extends InputMedia {
  String type;
  String media;
  String? caption;
  ParseMode? parseMode;
  List<MessageEntity>? captionEntities;

  InputMediaPhoto({
    required this.type,
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
      'parse_mode': parseMode.toString(),
    };
  }
}
