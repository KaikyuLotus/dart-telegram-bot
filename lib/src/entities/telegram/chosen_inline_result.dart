import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// Represents a result of an inline query that was chosen by the user and sent
/// to their chat partner.
class ChosenInlineResult {
  /// The unique identifier for the result that was chosen
  String resultId;

  /// The user that chose the result
  User from;

  /// Sender location, only for bots that require user location
  Location? location;

  /// Identifier of the sent inline message.
  ///
  /// Available only if there is an inline keyboard attached to the message.
  ///
  /// Will be also received in callback queries and can be used to
  /// [edit](https://core.telegram.org/bots/api#updating-messages) the message.
  String? inlineMessageId;

  /// The query that was used to obtain the result
  String query;

  /// Basic constructor
  ChosenInlineResult({
    required this.resultId,
    required this.from,
    required this.query,
    this.location,
    this.inlineMessageId,
  });

  /// Creates an object from a json
  factory ChosenInlineResult.fromJson(Map<String, dynamic> json) {
    return ChosenInlineResult(
      resultId: json['result_id'],
      from: User.fromJson(json['from']),
      location: callIfNotNull(Location.fromJson, json['location']),
      inlineMessageId: json['inline_message_id'],
      query: json['query'],
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'result_id': resultId,
      'from': from,
      'location': location,
      'inline_message_id': inlineMessageId,
      'query': query,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
