import 'dart:convert';

import '../../../telegram_entities.dart';

class ChatLocation {
  Location location;
  String address;

  ChatLocation({
    required this.location,
    required this.address,
  });

  static ChatLocation fromJson(Map<String, dynamic> json) {
    return ChatLocation(
      location: json['location'],
      address: json['address'],
    );
  }

  Map toJson() {
    return {
      'location': location,
      'address': address,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
