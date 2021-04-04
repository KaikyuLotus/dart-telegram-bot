import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

class KeyboardButtonPollType {
  PollType? type;

  KeyboardButtonPollType({this.type});

  static KeyboardButtonPollType fromJson(Map<String, dynamic> json) {
    return KeyboardButtonPollType(
      type: callIfNotNull(PollType.forValue, json['type']),
    );
  }

  Map toJson() {
    return {
      'type': type,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
