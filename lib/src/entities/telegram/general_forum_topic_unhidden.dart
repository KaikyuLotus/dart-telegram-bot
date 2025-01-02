import 'dart:convert';

/// This object represents a service message about General forum topic unhidden
/// in the chat.
///
/// Currently holds no information.
class GeneralForumTopicUnhidden {
  /// Basic constructor
  GeneralForumTopicUnhidden();

  /// Creates an object from a json
  factory GeneralForumTopicUnhidden.fromJson(Map<String, dynamic> _) {
    return GeneralForumTopicUnhidden();
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String toString() => json.encode(this);
}
