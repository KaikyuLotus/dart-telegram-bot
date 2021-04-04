import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

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
      textEntities: callIfNotNull(
        MessageEntity.listFromJsonArray,
        json['text_entities'],
      ),
      animation: callIfNotNull(
        Animation.fromJson,
        json['animation'],
      ),
    );
  }

  Map toJson() {
    return {
      'title': title,
      'description': description,
      'photo': photo,
      'text': text,
      'text_entities': textEntities,
      'animation': animation,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
