import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// This object represents an incoming inline query.
/// When the user sends an empty query, your bot could return some default or
/// trending results.
class InlineQuery {
  /// Unique identifier for this query
  String id;

  /// Sender
  User from;

  /// Text of the query (up to 256 characters)
  String query;

  /// Offset of the results to be returned, can be controlled by the bot
  String offset;

  /// Optional.
  /// Type of the chat from which the inline query was sent.
  /// Can be either “sender” for a private chat with the inline query sender,
  /// “private”, “group”, “supergroup”, or “channel”.
  /// The chat type should be always known for requests sent from official
  /// clients and most third-party clients, unless the request was sent from
  /// a secret chat
  String? chatType;

  /// Optional.
  /// Sender location, only for bots that request user location
  Location? location;

  /// Basic constructor
  InlineQuery({
    required this.id,
    required this.from,
    required this.query,
    required this.offset,
    this.chatType,
    this.location,
  });

  /// Creates a object from a json
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

  /// Creates a json from the object
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
