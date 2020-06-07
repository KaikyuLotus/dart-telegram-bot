part of '../../entities.dart';

class PollOption {
  String text;
  int voterCount;

  PollOption({this.text, this.voterCount});

  factory PollOption.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return PollOption(text: json['text'], voterCount: json['voter_count']);
  }

  static List<PollOption> listFromJsonArray(List<dynamic> json) {
    if (json == null) return null;
    return List.generate(json.length, (i) => PollOption.fromJson(json[i]));
  }
}
