import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents a location to which a chat is connected.
class ChatLocation {
  /// The location to which the supergroup is connected.
  /// Can't be a live location.
  Location location;

  /// Location address; 1-64 characters, as defined by the chat owner
  String address;

  /// Basic constructor
  ChatLocation({
    required this.location,
    required this.address,
  });

  /// Creates a object from a json
  static ChatLocation fromJson(Map<String, dynamic> json) {
    return ChatLocation(
      location: Location.fromJson(json['location']!),
      address: json['address']!,
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'location': location,
      'address': address,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
