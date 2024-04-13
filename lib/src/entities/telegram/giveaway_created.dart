import 'dart:convert';

/// This object represents a service message about the creation of a scheduled
/// giveaway.
/// Currently holds no information.
class GiveawayCreated {
  /// Basic constructor
  GiveawayCreated();

  /// Creates a object from json
  factory GiveawayCreated.fromJson(Map<String, dynamic> _) {
    return GiveawayCreated();
  }

  /// Creates a json from the object
  Map toJson() {
    return {};
  }

  @override
  String toString() => json.encode(this);
}
