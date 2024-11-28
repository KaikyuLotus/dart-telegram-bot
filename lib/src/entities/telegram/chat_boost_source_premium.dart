import 'dart:convert';

import '../../../telegram_entities.dart';

/// The boost was obtained by subscribing to Telegram Premium or by gifting a
/// Telegram Premium subscription to another user.
class ChatBoostSourcePremium extends ChatBoostSource {
  /// Source of the boost, always “premium”
  @override
  final String source = 'premium';

  /// User that boosted the chat
  User user;

  /// Basic constructor
  ChatBoostSourcePremium({
    required this.user,
  });

  /// Creates an object from a json
  factory ChatBoostSourcePremium.fromJson(Map<String, dynamic> json) {
    return ChatBoostSourcePremium(
      user: User.fromJson(json['user']),
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'source': source,
      'user': user,
    };
  }

  @override
  String toString() => json.encode(this);
}
