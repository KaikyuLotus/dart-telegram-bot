import 'dart:convert';

import '../../../telegram_entities.dart';

/// This object contains information about a chat boost.
class ChatBoost {
  /// Unique identifier of the boost
  String boostId;

  /// Point in time (Unix timestamp) when the chat was boosted
  int addDate;

  /// Point in time (Unix timestamp) when the boost will automatically expire,
  /// unless the booster's Telegram Premium subscription is prolonged
  int expirationDate;

  /// Source of the added boost
  ChatBoostSource source;

  /// Basic constructor
  ChatBoost({
    required this.boostId,
    required this.addDate,
    required this.expirationDate,
    required this.source,
  });

  /// Creates an object from a json
  factory ChatBoost.fromJson(Map<String, dynamic> json) {
    return ChatBoost(
      boostId: json['boost_id'],
      addDate: json['add_date'],
      expirationDate: json['expiration_date'],
      source: ChatBoostSource.fromJson(json['source']),
    );
  }

  /// Creates a list of objects from a json array
  static List<ChatBoost> listFromJsonArray(List<dynamic> array) {
    return List.generate(
      array.length,
      (i) => ChatBoost.fromJson(array[i]),
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'boost_id': boostId,
      'add_date': addDate,
      'expiration_date': expirationDate,
      'source': source,
    };
  }

  @override
  String toString() => json.encode(this);
}
