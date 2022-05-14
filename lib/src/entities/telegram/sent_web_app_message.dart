class SentWebAppMessage {
  String? inlineMessageId;

  SentWebAppMessage(
    this.inlineMessageId,
  );

  static SentWebAppMessage fromJson(Map<String, dynamic> json) {
    return SentWebAppMessage(
      json['inline_message_id'],
    );
  }

  Map toJson() {
    return {
      'inline_message_id': inlineMessageId,
    };
  }
}
