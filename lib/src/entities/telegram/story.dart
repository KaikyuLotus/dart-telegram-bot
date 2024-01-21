import 'dart:convert';

/// This object represents a message about a forwarded story in the chat
/// Currently holds no information.
class Story {
  /// Basic constructor
  Story();

  /// Creates a object from a json
  factory Story.fromJson(Map<String, dynamic> _) {
    return Story();
  }

  /// Creates a json from the object
  Map toJson() {
    return {};
  }

  @override
  String toString() => json.encode(this);
}
