import 'dart:convert';

class VoiceChatScheduled {
  int startDate;

  VoiceChatScheduled({
    required this.startDate,
  });

  static VoiceChatScheduled fromJson(Map<String, dynamic> json) {
    return VoiceChatScheduled(
      startDate: json['startDate'],
    );
  }

  Map toJson() {
    return {
      'startDate': startDate,
    };
  }

  @override
  String toString() => json.encode(this);
}
