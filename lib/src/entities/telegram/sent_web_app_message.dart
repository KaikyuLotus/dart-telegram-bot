/// Describes an inline message sent by a [Web App](https://core.telegram.org/bots/webapps)
/// on behalf of a user.
class SentWebAppMessage {
  /// Identifier of the sent inline message.
  ///
  /// Available only if there is an inline keyboard attached to the message.
  String? inlineMessageId;

  /// Basic constructor
  SentWebAppMessage({
    this.inlineMessageId,
  });

  /// Creates an object from a json
  factory SentWebAppMessage.fromJson(Map<String, dynamic> json) {
    return SentWebAppMessage(
      inlineMessageId: json['inline_message_id'],
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'inline_message_id': inlineMessageId,
    }..removeWhere((_, v) => v == null);
  }
}
