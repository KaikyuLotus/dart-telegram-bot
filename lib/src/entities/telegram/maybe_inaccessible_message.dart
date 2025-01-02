import '../../../telegram_entities.dart';

/// This object describes a message that can be inaccessible to the bot.
/// It can be one of:
/// Message,
/// InaccessibleMessage
abstract class MaybeInaccessibleMessage {
  abstract Chat chat;
  abstract int messageId;
  abstract int date;

  /// Creates an object from a json
  static MaybeInaccessibleMessage fromJson(Map<String, dynamic> json) {
    if (json['date'] == 0) {
      return InaccessibleMessage.fromJson(json);
    } else {
      return Message.fromJson(json);
    }
  }
}
