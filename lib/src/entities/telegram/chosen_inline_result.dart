import 'package:dart_telegram_bot/telegram_entities.dart';

class ChosenInlineResult {
  String resultId;
  User from;
  Location location;
  String inlineMessageId;
  String query;

  ChosenInlineResult(
    this.resultId,
    this.from,
    this.query, {
    this.location,
    this.inlineMessageId,
  });

  factory ChosenInlineResult.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return ChosenInlineResult(
      json['result_id'],
      User.fromJson(json['from']),
      json['query'],
      location: Location.fromJson(json['location']),
      inlineMessageId: json['inline_message_id'],
    );
  }
}
