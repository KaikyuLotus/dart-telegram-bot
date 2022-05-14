import 'dart:convert';

class VideoChatEnded {
  int duration;

  VideoChatEnded(this.duration);

  static VideoChatEnded fromJson(Map<String, dynamic> json) {
    return VideoChatEnded(json['duration']);
  }

  Map toJson() {
    return {
      'duration': duration,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
