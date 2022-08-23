import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents a Game.
class InlineQueryResultGame extends InlineQueryResult {
  /// Type of the result, must be game
  String type = 'game';

  /// Unique identifier for this result, 1-64 bytes
  String id;

  /// Short name of the game
  String gameShortName;

  /// Optional.
  /// Inline keyboard attached to the message
  InlineKeyboardMarkup? replyMarkup;

  /// Basic constructor
  InlineQueryResultGame({
    required this.id,
    required this.gameShortName,
    this.replyMarkup,
  });

  /// Creates a json from the object
  Map toJson() {
    return {
      'type': type,
      'id': id,
      'game_short_name': gameShortName,
      'reply_markup': replyMarkup,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
