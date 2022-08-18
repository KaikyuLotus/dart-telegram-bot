/// Describes an inline message sent by a Web App on behalf of a user.
class SentWebAppMessage {
  /// Optional.
  /// Identifier of the sent inline message.
  /// Available only if there is an inline keyboard attached to the message.
  String? inlineMessageId;

  /// Basic constructor
  SentWebAppMessage(
    this.inlineMessageId,
  );

  /// Creates a object from a json
  static SentWebAppMessage fromJson(Map<String, dynamic> json) {
    return SentWebAppMessage(
      json['inline_message_id'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'inline_message_id': inlineMessageId,
    };
  }
}
