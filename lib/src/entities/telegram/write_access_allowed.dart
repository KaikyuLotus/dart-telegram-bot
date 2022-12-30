import 'dart:convert';

/// This object represents a service message about a user allowing a bot added
/// to the attachment menu to write messages.
/// Currently holds no information.
class WriteAccessAllowed {
  /// Basic constructor
  WriteAccessAllowed();

  /// Creates a object from a json
  static WriteAccessAllowed fromJson(Map<String, dynamic> json) {
    return WriteAccessAllowed();
  }

  /// Creates a json from the object
  Map toJson() {
    return {};
  }

  @override
  String toString() => json.encode(this);
}
