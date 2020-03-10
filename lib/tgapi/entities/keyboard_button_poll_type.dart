import 'package:dart_telegram_bot/tgapi/enums/poll_type.dart';

class KeyboardButtonPollType {
  PollType type;

  KeyboardButtonPollType({this.type});

  factory KeyboardButtonPollType.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return KeyboardButtonPollType(type: PollType.fromString(json['type']));
  }

  Map toJson() {
    return type != null ? {'type': type.toString()} : {};
  }
}
