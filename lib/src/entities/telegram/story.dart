import 'dart:convert';

import '../../../telegram_entities.dart';

/// This object represents a story.
class Story {
  /// Chat that posted the story
  Chat chat;

  /// Unique identifier for the story in the chat
  int id;

  /// Basic constructor
  Story(
    this.chat,
    this.id,
  );

  /// Creates a object from a json
  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      Chat.fromJson(json['chat']),
      json['id'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'chat': chat,
      'id': id,
    };
  }

  @override
  String toString() => json.encode(this);
}
