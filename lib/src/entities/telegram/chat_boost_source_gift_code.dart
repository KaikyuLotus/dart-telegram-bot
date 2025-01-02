import 'dart:convert';

import '../../../telegram_entities.dart';

/// The boost was obtained by the creation of Telegram Premium gift codes
/// to boost a chat.
///
/// Each such code boosts the chat 4 times for the duration of thecorresponding
/// Telegram Premium subscription.
class ChatBoostSourceGiftCode extends ChatBoostSource {
  /// Source of the boost, always “gift_code”
  @override
  final String source = 'gift_code';

  /// User for which the gift code was created
  User user;

  /// Basic constructor
  ChatBoostSourceGiftCode({
    required this.user,
  });

  /// Creates an object from a json
  factory ChatBoostSourceGiftCode.fromJson(Map<String, dynamic> json) {
    return ChatBoostSourceGiftCode(
      user: User.fromJson(json['user']),
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'source': source,
      'user': user,
    };
  }

  @override
  String toString() => json.encode(this);
}
