import 'dart:convert';

/// Currently holds no information
class VideoChatStarted {
  VideoChatStarted();

  static VideoChatStarted fromJson(Map<String, dynamic> json) {
    return VideoChatStarted();
  }

  Map toJson() {
    return {}..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
