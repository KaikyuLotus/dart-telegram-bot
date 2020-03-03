class KeyboardButtonPollType {
  String type;

  KeyboardButtonPollType({this.type});

  factory KeyboardButtonPollType.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return KeyboardButtonPollType(type: json['type']);
  }
}
