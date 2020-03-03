class ResponseParameters {
  int migrateToChatId;
  int retryAfter;

  ResponseParameters({this.migrateToChatId, this.retryAfter});

  factory ResponseParameters.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return ResponseParameters(migrateToChatId: json['migrate_to_chat_id'], retryAfter: json['retry_after']);
  }
}
