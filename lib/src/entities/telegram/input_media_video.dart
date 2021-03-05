import 'package:dart_telegram_bot/telegram_entities.dart';

class InputMediaVideo extends InputMedia {
  String type;
  String media;
  HttpFile? thumb;
  String? caption;
  String? parseMode;
  List<MessageEntity>? captionEntities;
  int? width;
  int? height;
  int? duration;
  bool? supportsStreaming;

  InputMediaVideo({
    required this.type,
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

// TODO implement toJson

}
