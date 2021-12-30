import 'dart:convert';

import '../../../telegram_entities.dart';

class InlineQueryResultGame extends InlineQueryResult {
  String type = 'game';
  String id;
  String gameShortName;
  InlineKeyboardMarkup? replyMarkup;

  InlineQueryResultGame({
    required this.id,
    required this.gameShortName,
    this.replyMarkup,
  });

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
