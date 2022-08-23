import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// This object represents a game.
/// Use BotFather to create and edit games, their short names will act as
/// unique identifiers.
class Game {
  /// Title of the game
  String title;

  /// Description of the game
  String description;

  /// Photo that will be displayed in the game message in chats.
  List<PhotoSize> photo;

  /// Optional.
  /// Brief description of the game or high scores included in the game message.
  /// Can be automatically edited to include current high scores for the game
  /// when the bot calls setGameScore, or manually edited using editMessageText.
  /// 0-4096 characters.
  String? text;

  /// Optional.
  /// Special entities that appear in text, such as usernames, URLs, bot
  /// commands, etc.
  List<MessageEntity>? textEntities;

  /// Optional.
  /// Animation that will be displayed in the game message in chats.
  /// Upload via BotFather
  Animation? animation;

  /// Basic constructor
  Game({
    required this.title,
    required this.description,
    required this.photo,
    this.text,
    this.textEntities,
    this.animation,
  });

  /// Creates a object from a json
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

  /// Creates a json from the object
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
