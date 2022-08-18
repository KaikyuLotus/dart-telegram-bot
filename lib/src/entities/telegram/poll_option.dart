import 'dart:convert';

/// This object contains information about one answer option in a poll.
class PollOption {
  /// Option text, 1-100 characters
  String text;

  /// Number of users that voted for this option
  int voterCount;

  /// Basic constructor
  PollOption({
    required this.text,
    required this.voterCount,
  });

  /// Creates a object from a json
  static PollOption fromJson(Map<String, dynamic> json) {
    return PollOption(
      text: json['text']!,
      voterCount: json['voter_count']!,
    );
  }

  /// Creates a list of object from a json array
  static List<PollOption> listFromJsonArray(List<dynamic> json) {
    return List.generate(json.length, (i) => PollOption.fromJson(json[i]));
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'text': text,
      'voter_count': voterCount,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
