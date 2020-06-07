part of '../../entities.dart';

class Game {
  String title;
  String description;
  List<PhotoSize> photo;
  String text;
  List<MessageEntity> textEntities;
  Animation animation;

  Game({this.title, this.description, this.photo, this.text, this.textEntities, this.animation});

  factory Game.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return Game(
      title: json['title'],
      description: json['description'],
      photo: PhotoSize.listFromJsonArray(json['photo']),
      text: json['text'],
      textEntities: MessageEntity.listFromJsonArray(json['text_entities']),
      animation: Animation.fromJson(json['animation']),
    );
  }
}
