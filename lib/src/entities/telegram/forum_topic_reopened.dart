import 'dart:convert';

/// This object represents a service message about a forum topic reopened
/// in the chat.
/// Currently holds no information.
class ForumTopicReopened {
  /// Basic constructor
  ForumTopicReopened();

  /// Creates a object from a json
  static ForumTopicReopened fromJson(Map<String, dynamic> json) {
    return ForumTopicReopened();
  }

  /// Creates a json from the object
  Map toJson() {
    return {};
  }

  @override
  String toString() => json.encode(this);
}
