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

  // TODO implement toJson

}
