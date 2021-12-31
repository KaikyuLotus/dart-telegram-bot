import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

class InlineQuery {
  String id;
  User from;
  String query;
  String offset;
  String? chatType;
  Location? location;

  InlineQuery({
    required this.id,
    required this.from,
    required this.query,
    required this.offset,
    this.chatType,
    this.location,
  });

  static InlineQuery fromJson(Map<String, dynamic> json) {
    return InlineQuery(
      id: json['id']!,
      from: User.fromJson(json['from']!),
      query: json['query']!,
      offset: json['offset']!,
      chatType: json['chat_type'],
      location: callIfNotNull(Location.fromJson, json['location']),
    );
  }

  Map toJson() {
    return {
      'id': id,
      'from': from,
      'query': query,
      'offset': offset,
      'chat_type': chatType,
      'location': location,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
