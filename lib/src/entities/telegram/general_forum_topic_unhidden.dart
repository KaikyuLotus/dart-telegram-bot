import 'dart:convert';

/// This object represents a service message about General forum topic unhidden
/// in the chat.
/// Currently holds no information.
class GeneralForumTopicUnhidden {
  /// Basic constructor
  GeneralForumTopicUnhidden();

  /// Creates a object from a json
  static GeneralForumTopicUnhidden fromJson(Map<String, dynamic> json) {
    return GeneralForumTopicUnhidden();
  }

  /// Creates a json from the object
  Map toJson() {
    return {};
  }

  @override
  String toString() => json.encode(this);
}
