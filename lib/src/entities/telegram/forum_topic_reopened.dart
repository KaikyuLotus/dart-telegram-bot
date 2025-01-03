import 'dart:convert';

/// This object represents a service message about a forum topic reopened
/// in the chat.
///
/// Currently holds no information.
class ForumTopicReopened {
  /// Basic constructor
  ForumTopicReopened();

  /// Creates an object from a json
  factory ForumTopicReopened.fromJson(Map<String, dynamic> _) {
    return ForumTopicReopened();
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String toString() => json.encode(this);
}
