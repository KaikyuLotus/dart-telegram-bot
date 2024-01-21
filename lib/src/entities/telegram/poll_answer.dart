import 'dart:convert';

import 'package:dart_telegram_bot/src/entities/internal/helpers/util.dart';

import '../../../telegram_entities.dart';

/// This object represents an answer of a user in a non-anonymous poll.
class PollAnswer {
  /// Unique poll identifier
  String pollId;

  /// Optional.
  /// The chat that changed the answer to the poll, if the voter is anonymous
  Chat? voterChat;

  /// Optional.
  /// The user that changed the answer to the poll, if the voter isn't anonymous
  User? user;

  /// 0-based identifiers of answer options, chosen by the user.
  /// May be empty if the user retracted their vote.
  List<int> optionIds;

  /// Basic constructor
  PollAnswer({
    required this.pollId,
    this.voterChat,
    this.user,
    required this.optionIds,
  });

  /// Creates a object from a json
  factory PollAnswer.fromJson(Map<String, dynamic> json) {
    return PollAnswer(
      pollId: json['poll_id']!,
      voterChat: callIfNotNull(Chat.fromJson, json['voter_chat']),
      user: callIfNotNull(User.fromJson, json['user']),
      optionIds: json['option_ids']!,
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'poll_id': pollId,
      'voter_chat': voterChat,
      'user': user,
      'option_ids': optionIds,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
