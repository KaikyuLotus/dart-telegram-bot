import 'dart:convert';

/// This object represents a service message about a video chat ended in the
/// chat.
class VideoChatEnded {
  /// Video chat duration in seconds
  int duration;

  /// Basic constructor
  VideoChatEnded(this.duration);

  /// Creates an object from a json
  factory VideoChatEnded.fromJson(Map<String, dynamic> json) {
    return VideoChatEnded(json['duration']);
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'duration': duration,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
