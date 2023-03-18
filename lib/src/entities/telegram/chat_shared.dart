import 'dart:convert';

/// This object contains information about the chat whose identifier was shared
/// with the bot using a KeyboardButtonRequestChat button.
class ChatShared {
  /// Identifier of the request
  int requestId;

  /// Identifier of the shared user.
  /// This number may have more than 32 significant bits and some programming
  /// languages may have difficulty/silent defects in interpreting it.
  /// But it has at most 52 significant bits, so a 64-bit integer or
  /// double-precision float type are safe for storing this identifier.
  /// The bot may not have access to the user and could be unable to use this
  /// identifier, unless the user is already known to the bot by some
  /// other means.
  int userId;

  /// Basic constructor
  ChatShared(
    this.requestId,
    this.userId,
  );

  /// Creates a object from a json
  static ChatShared fromJson(Map<String, dynamic> json) {
    return ChatShared(
      json['request_id'],
      json['user_id'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'request_id': requestId,
      'user_id': userId,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
