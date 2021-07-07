import 'dart:convert';

import '../../../telegram_entities.dart';

class InlineQuery {
  String id;
  User from;
  Location? location;
  String query;
  String offset;

  InlineQuery({
    required this.id,
    required this.from,
    required this.query,
    required this.offset,
    this.location,
  });

  static InlineQuery fromJson(Map<String, dynamic> json) {
    return InlineQuery(
      id: json['id']!,
      from: User.fromJson(json['from']!),
      query: json['query']!,
      offset: json['offset']!,
      location: Location.fromJson(json['location']),
    );
  }

  Map toJson() {
    return {
      'id': id,
      'from': from,
      'query': query,
      'offset': offset,
      'location': location,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
