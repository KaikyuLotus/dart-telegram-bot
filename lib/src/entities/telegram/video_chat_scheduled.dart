import 'dart:convert';

/// This object represents a service message about a video chat scheduled in
/// the chat.
class VideoChatScheduled {
  /// Point in time (Unix timestamp) when the video chat is supposed to be
  /// started by a chat administrator
  int startDate;

  /// Basic constructor
  VideoChatScheduled({
    required this.startDate,
  });

  /// Creates a object from a json
  static VideoChatScheduled fromJson(Map<String, dynamic> json) {
    return VideoChatScheduled(
      startDate: json['start_date'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'start_date': startDate,
    };
  }

  @override
  String toString() => json.encode(this);
}
