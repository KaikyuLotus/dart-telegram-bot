import 'dart:convert';

class VoiceChatScheduled {
  int startDate;

  VoiceChatScheduled({
    required this.startDate,
  });

  static VoiceChatScheduled fromJson(Map<String, dynamic> json) {
    return VoiceChatScheduled(
      startDate: json['start_date'],
    );
  }

  Map toJson() {
    return {
      'start_date': startDate,
    };
  }

  @override
  String toString() => json.encode(this);
}
