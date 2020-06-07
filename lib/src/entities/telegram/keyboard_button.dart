part of '../../entities.dart';

class KeyboardButton {
  String text;
  bool requestContact;
  bool requestLocation;
  KeyboardButtonPollType requestPoll;

  KeyboardButton._({this.text, this.requestContact, this.requestLocation, this.requestPoll});

  KeyboardButton.RequestContact(this.text, this.requestContact);

  KeyboardButton.RequestLocation(this.text, this.requestLocation);

  KeyboardButton.RequestPoll(this.text, this.requestPoll);

  factory KeyboardButton.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return KeyboardButton._(
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

  Map toJson() {
    var data = {};
    data['text'] = text;
    data['request_contact'] = requestContact;
    data['request_location'] = requestLocation;
    data['request_poll'] = requestPoll;
    data.removeWhere((k, v) => v == null);
    return data;
  }
}
