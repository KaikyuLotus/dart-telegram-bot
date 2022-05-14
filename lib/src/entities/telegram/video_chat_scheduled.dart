import 'dart:convert';

class VideoChatScheduled {
  int startDate;

  VideoChatScheduled({
    required this.startDate,
  });

  static VideoChatScheduled fromJson(Map<String, dynamic> json) {
    return VideoChatScheduled(
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
