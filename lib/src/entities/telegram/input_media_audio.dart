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

  // TODO implement toJson

}
