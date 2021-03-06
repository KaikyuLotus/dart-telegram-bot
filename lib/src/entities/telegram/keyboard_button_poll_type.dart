import 'dart:convert';

import 'package:dart_telegram_bot/dart_telegram_bot.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';

class KeyboardButtonPollType {
  PollType? type;

  KeyboardButtonPollType({this.type});

  static KeyboardButtonPollType fromJson(Map<String, dynamic> json) {
    return KeyboardButtonPollType(
      type: json['type'] != null
          ? EnumHelper.decode(
              PollType.values,
              json['type'],
            )
          : json['type'],
    );
  }

  Map toJson() {
    return {
      'type': EnumHelper.encode(type),
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
