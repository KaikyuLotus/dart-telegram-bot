import 'dart:convert';

import '../../../telegram_entities.dart';

class GameHighScore {
  int position;
  User user;
  int score;

  GameHighScore({
    required this.position,
    required this.user,
    required this.score,
  });

  static GameHighScore fromJson(Map<String, dynamic> json) {
    return GameHighScore(
      position: json['position']!,
      user: User.fromJson(json['user']!),
      score: json['score']!,
    );
  }

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
