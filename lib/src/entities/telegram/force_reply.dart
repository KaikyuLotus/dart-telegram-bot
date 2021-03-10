import 'dart:convert';

import 'package:dart_telegram_bot/telegram_entities.dart';

class ForceReply extends ReplyMarkup {
  bool forceReply = true;
  bool? selective;

  ForceReply(
    this.forceReply, {
    this.selective,
  });

  static ForceReply fromJson(Map<String, dynamic> json) {
    return ForceReply(
      json['force_reply'],
      selective: json['selective'],
    );
  }

  Map toJson() {
    return {
      'force_reply': forceReply,
      'selective': selective,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
