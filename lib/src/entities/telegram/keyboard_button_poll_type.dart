import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// This object represents type of a poll, which is allowed to be created and
/// sent when the corresponding button is pressed.
class KeyboardButtonPollType {
  /// Optional. If quiz is passed, the user will be allowed to create only polls
  /// in the quiz mode. If regular is passed,
  /// only regular polls will be allowed.
  /// Otherwise, the user will be allowed to create a poll of any type.
  PollType? type;

  /// Basic constructor
  KeyboardButtonPollType({this.type});

  /// Creates a object from a json
  static KeyboardButtonPollType fromJson(Map<String, dynamic> json) {
    return KeyboardButtonPollType(
      type: callIfNotNull(PollType.forValue, json['type']),
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'type': type,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
