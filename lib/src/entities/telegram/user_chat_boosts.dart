import 'dart:convert';

import '../../../telegram_entities.dart';

/// This object represents a list of boosts added to a chat by a user.
class UserChatBoosts {
  /// The list of boosts added to the chat by the user
  List<ChatBoost> boosts;

  /// Basic constructor
  UserChatBoosts({
    required this.boosts,
  });

  /// Creates an object from a json
  factory UserChatBoosts.fromJson(Map<String, dynamic> json) {
    return UserChatBoosts(
      boosts: ChatBoost.listFromJsonArray(json['boosts']),
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'boosts': boosts,
    };
  }

  @override
  String toString() => json.encode(this);
}
