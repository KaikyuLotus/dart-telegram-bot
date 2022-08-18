import 'dart:convert';

/// This object represents a service message about a video chat started in the
/// chat. Currently holds no information.
class VideoChatStarted {
  /// Basic constructor
  VideoChatStarted();

  /// Creates a object from a json
  static VideoChatStarted fromJson(Map<String, dynamic> json) {
    return VideoChatStarted();
  }

  /// Creates a json from the object
  Map toJson() {
    return {}..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
