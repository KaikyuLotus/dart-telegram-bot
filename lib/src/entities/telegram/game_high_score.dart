import 'dart:convert';

import '../../../telegram_entities.dart';

/// This object represents one row of the high scores table for a game.
class GameHighScore {
  /// Position in high score table for the game
  int position;

  /// User
  User user;

  /// Score
  int score;

  /// Basic constructor
  GameHighScore({
    required this.position,
    required this.user,
    required this.score,
  });

  /// Creates a object from a json
  static GameHighScore fromJson(Map<String, dynamic> json) {
    return GameHighScore(
      position: json['position']!,
      user: User.fromJson(json['user']!),
      score: json['score']!,
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'position': position,
      'user': user,
      'score': score,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
