import 'dart:convert';

/// Currently holds no information
class VoiceChatStarted {
  VoiceChatStarted();

  static VoiceChatStarted fromJson(Map<String, dynamic> json) {
    return VoiceChatStarted();
  }

  Map toJson() {
    return {}..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
