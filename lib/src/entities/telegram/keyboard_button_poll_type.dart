import 'package:dart_telegram_bot/telegram_entities.dart';
import 'package:dart_telegram_bot/dart_telegram_bot.dart';

class KeyboardButtonPollType {
  PollType type;

  KeyboardButtonPollType({this.type});

  factory KeyboardButtonPollType.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return KeyboardButtonPollType(
      type: EnumHelper.decode(PollType.values, json['type']),
    );
  }

  Map toJson() {
    return type != null ? {'type': type.toString()} : {};
  }
}
