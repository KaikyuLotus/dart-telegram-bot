import 'dart:convert';

class VoiceChatEnded {
  int duration;

  VoiceChatEnded(this.duration);

  static VoiceChatEnded fromJson(Map<String, dynamic> json) {
    return VoiceChatEnded(json['duration']);
  }

  Map toJson() {
    return {
      'duration': duration,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
