import 'dart:convert';

class ResponseParameters {
  int? migrateToChatId;
  int? retryAfter;

  ResponseParameters({
    this.migrateToChatId,
    this.retryAfter,
  });

  static ResponseParameters fromJson(Map<String, dynamic> json) {
    return ResponseParameters(
      migrateToChatId: json['migrate_to_chat_id'],
      retryAfter: json['retry_after'],
    );
  }

  Map toJson() {
    return {
      'migrate_to_chat_id': migrateToChatId,
      'retry_after': retryAfter,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
