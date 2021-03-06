import 'dart:convert';

import 'package:dart_telegram_bot/src/entities/internal/helpers/util.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';

class ChosenInlineResult {
  String resultId;
  User from;
  Location? location;
  String? inlineMessageId;
  String query;

  ChosenInlineResult({
    required this.resultId,
    required this.from,
    required this.query,
    this.location,
    this.inlineMessageId,
  });

  static ChosenInlineResult fromJson(Map<String, dynamic> json) {
    return ChosenInlineResult(
      resultId: json['result_id']!,
      from: User.fromJson(json['from']!),
      query: json['query']!,
      location: callIfNotNull(Location.fromJson, json['location']),
      inlineMessageId: json['inline_message_id'],
    );
  }

  Map toJson() {
    return {
      'result_id': resultId,
      'from': from,
      'query': query,
      'location': location,
      'inline_message_id': inlineMessageId,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
