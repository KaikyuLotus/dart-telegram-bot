import 'dart:convert';

/// This object represents a service message about a forum topic closed
/// in the chat.
///
/// Currently holds no information.
class ForumTopicClosed {
  /// Basic constructor
  ForumTopicClosed();

  /// Creates a object from a json
  factory ForumTopicClosed.fromJson(Map<String, dynamic> _) {
    return ForumTopicClosed();
  }

  /// Creates a json from the object
  Map toJson() {
    return {};
  }

  @override
  String toString() => json.encode(this);
}
