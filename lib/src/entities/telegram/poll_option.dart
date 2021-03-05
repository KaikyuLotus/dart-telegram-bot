class PollOption {
  String text;
  int voterCount;

  PollOption({
    required this.text,
    required this.voterCount,
  });

  static PollOption fromJson(Map<String, dynamic> json) {
    return PollOption(
      text: json['text']!,
      voterCount: json['voter_count']!,
    );
  }

  static List<PollOption> listFromJsonArray(List<dynamic> json) {
    return List.generate(json.length, (i) => PollOption.fromJson(json[i]));
  }
}
