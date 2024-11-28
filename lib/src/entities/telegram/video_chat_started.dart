import 'dart:convert';

/// This object represents a service message about a video chat started in the
/// chat. Currently holds no information.
class VideoChatStarted {
  /// Basic constructor
  VideoChatStarted();

  /// Creates an object from a json
  factory VideoChatStarted.fromJson(Map<String, dynamic> _) {
    return VideoChatStarted();
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {}..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
