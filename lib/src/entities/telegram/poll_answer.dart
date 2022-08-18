import 'dart:convert';

import '../../../telegram_entities.dart';

/// This object represents an answer of a user in a non-anonymous poll.
class PollAnswer {
  /// Unique poll identifier
  String pollId;

  /// The user, who changed the answer to the poll
  User user;

  /// 0-based identifiers of answer options, chosen by the user.
  /// May be empty if the user retracted their vote.
  List<int> optionIds;

  /// Basic constructor
  PollAnswer({
    required this.pollId,
    required this.user,
    required this.optionIds,
  });

  /// Creates a object from a json
  static PollAnswer fromJson(Map<String, dynamic> json) {
    return PollAnswer(
      pollId: json['poll_id']!,
      user: json['user']!,
      optionIds: json['option_ids']!,
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'poll_id': pollId,
      'user': user,
      'option_ids': optionIds,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
