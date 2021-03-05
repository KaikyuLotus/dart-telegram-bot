import 'package:dart_telegram_bot/src/entities/internal/helpers/util.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';

class Game {
  String title;
  String description;
  List<PhotoSize> photo;
  String? text;
  List<MessageEntity>? textEntities;
  Animation? animation;

  Game({
    required this.title,
    required this.description,
    required this.photo,
    this.text,
    this.textEntities,
    this.animation,
  });

  static Game fromJson(Map<String, dynamic> json) {
    return Game(
      title: json['title']!,
      description: json['description']!,
      photo: PhotoSize.listFromJsonArray(json['photo']!),
      text: json['text'],
      textEntities: callIfNotNull(MessageEntity.listFromJsonArray, json['text_entities']),
      animation: Animation.fromJson(json['animation']),
    );
  }
}
