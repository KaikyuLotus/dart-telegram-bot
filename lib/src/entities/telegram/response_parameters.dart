import 'dart:convert';

/// Describes why a request was unsuccessful.
class ResponseParameters {
  /// Optional.
  /// The group has been migrated to a supergroup with the specified identifier.
  /// This number may have more than 32 significant bits and some programming
  /// languages may have difficulty/silent defects in interpreting it.
  /// But it has at most 52 significant bits, so a signed 64-bit integer or
  /// double-precision float type are safe for storing this identifier.
  int? migrateToChatId;

  /// Optional.
  /// In case of exceeding flood control, the number of seconds left to wait
  /// before the request can be repeated
  int? retryAfter;

  /// Basic constructor
  ResponseParameters({
    this.migrateToChatId,
    this.retryAfter,
  });

  /// Creates a object from a json
  static ResponseParameters fromJson(Map<String, dynamic> json) {
    return ResponseParameters(
      migrateToChatId: json['migrate_to_chat_id'],
      retryAfter: json['retry_after'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'migrate_to_chat_id': migrateToChatId,
      'retry_after': retryAfter,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
