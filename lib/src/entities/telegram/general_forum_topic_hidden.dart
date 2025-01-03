import 'dart:convert';

/// This object represents a service message about General forum topic hidden
/// in the chat.
///
/// Currently holds no information.
class GeneralForumTopicHidden {
  /// Basic constructor
  GeneralForumTopicHidden();

  /// Creates an object from a json
  factory GeneralForumTopicHidden.fromJson(Map<String, dynamic> _) {
    return GeneralForumTopicHidden();
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String toString() => json.encode(this);
}
