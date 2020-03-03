import 'keyboard_button_poll_type.dart';

class KeyboardButton {
  String text;
  bool requestContact;
  bool requestLocation;
  KeyboardButtonPollType requestPoll;

  KeyboardButton({this.text, this.requestContact, this.requestLocation, this.requestPoll});

  factory KeyboardButton.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return KeyboardButton(
        text: json['text'],
        requestContact: json['request_contact'],
        requestLocation: json['request_location'],
        requestPoll: KeyboardButtonPollType.fromJson(json['request_poll']));
  }

  static List<KeyboardButton> listFromJsonArray(List<dynamic> json) {
    if (json == null) return null;
    return List.generate(json.length, (i) => KeyboardButton.fromJson(json[i]));
  }

  static List<List<KeyboardButton>> listOfListsFromJsonArray(List<List<dynamic>> json) {
    if (json == null) return null;
    return List.generate(json.length, (e) => List.generate(json[e].length, (i) => KeyboardButton.fromJson(json[e][i])));
  }
}
