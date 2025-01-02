import 'dart:convert';

/// This object represents a service message about a user boosting a chat.
class ChatBoostAdded {
  /// Number of boosts added by the user
  int boostCount;

  /// Basic constructor
  ChatBoostAdded(this.boostCount);

  /// Creates an object from a json
  factory ChatBoostAdded.fromJson(Map<String, dynamic> json) {
    return ChatBoostAdded(
      json['boost_count'],
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'boost_count': boostCount,
    };
  }

  @override
  String toString() => json.encode(this);
}
