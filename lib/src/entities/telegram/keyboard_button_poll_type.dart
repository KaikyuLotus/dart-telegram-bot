import 'package:dart_telegram_bot/dart_telegram_bot.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';

class KeyboardButtonPollType {
  PollType? type;

  KeyboardButtonPollType({this.type});

  static KeyboardButtonPollType fromJson(Map<String, dynamic> json) {
    return KeyboardButtonPollType(
      type: EnumHelper.decode(
        PollType.values,
        json['type'],
      ), // TODO type may be null
    );
  }

  Map toJson() {
    return type != null
        ? {'type': type.toString()}
        : {}; // TODO wrong enum encoding
  }
}
