import '../../../telegram_entities.dart';

/// This object describes the source of a chat boost.
/// It can be one of:
/// ChatBoostSourcePremium,
/// ChatBoostSourceGiftCode,
/// ChatBoostSourceGiveaway
abstract class ChatBoostSource {
  abstract final String source;

  static ChatBoostSource fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case 'user':
        return ChatBoostSourcePremium.fromJson(json);
      case 'hidden_user':
        return ChatBoostSourceGiftCode.fromJson(json);
      case 'chat':
        return ChatBoostSourceGiveaway.fromJson(json);
      default:
        throw Exception('ChatBoostSource type not recognized');
    }
  }
}
