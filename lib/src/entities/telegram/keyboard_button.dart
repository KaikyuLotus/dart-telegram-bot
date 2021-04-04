import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

class KeyboardButton {
  String text;
  bool? requestContact;
  bool? requestLocation;
  KeyboardButtonPollType? requestPoll;

  KeyboardButton._({
    required this.text,
    this.requestContact,
    this.requestLocation,
    this.requestPoll,
  });

  KeyboardButton.requestContact(this.text, {this.requestContact});

  KeyboardButton.requestLocation(this.text, {this.requestLocation});

  KeyboardButton.requestPoll(this.text, this.requestPoll);

  static KeyboardButton fromJson(Map<String, dynamic> json) {
    return KeyboardButton._(
      text: json['text']!,
      requestContact: json['request_contact'],
      requestLocation: json['request_location'],
      requestPoll: callIfNotNull(
        KeyboardButtonPollType.fromJson,
        json['request_poll'],
      ),
    );
  }

  static List<KeyboardButton> listFromJsonArray(List<dynamic> json) {
    return List.generate(
      json.length,
      (i) => KeyboardButton.fromJson(json[i]),
    );
  }

  static List<List<KeyboardButton>> listOfListsFromJsonArray(
      List<List<dynamic>> json) {
    return List.generate(
      json.length,
      (e) => List.generate(
        json[e].length,
        (i) => KeyboardButton.fromJson(json[e][i]),
      ),
    );
  }

  Map toJson() {
    return {
      'text': text,
      'request_contact': requestContact,
      'request_location': requestLocation,
      'request_poll': requestPoll,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
