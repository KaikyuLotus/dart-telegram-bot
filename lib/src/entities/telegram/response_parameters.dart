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
}
