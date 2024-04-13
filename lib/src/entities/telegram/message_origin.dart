import '../../../telegram_entities.dart';

/// This object describes the origin of a message.
/// It can be one of:
/// MessageOriginUser,
/// MessageOriginHiddenUser,
/// MessageOriginChat,
/// MessageOriginChannel
abstract class MessageOrigin {
  abstract final String type;

  static MessageOrigin fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case 'user':
        return MessageOriginUser.fromJson(json);
      case 'hidden_user':
        return MessageOriginHiddenUser.fromJson(json);
      case 'chat':
        return MessageOriginChat.fromJson(json);
      case 'channel':
        return MessageOriginChannel.fromJson(json);
      default:
        throw Exception('MessageOrigin type not recognized');
    }
  }
}
