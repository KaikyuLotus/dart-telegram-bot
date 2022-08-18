import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// This object contains information about a poll.
class Poll {
  /// Unique poll identifier
  String id;

  /// Poll question, 1-300 characters
  String question;

  ///List of poll options
  List<PollOption> options;

  /// Total number of users that voted in the poll
  int totalVoterCount;

  /// True, if the poll is closed
  bool isClosed;

  /// True, if the poll is anonymous
  bool isAnonymous;

  /// Poll type, currently can be “regular” or “quiz”
  PollType type;

  /// True, if the poll allows multiple answers
  bool allowsMultipleAnswers;

  /// Optional.
  /// 0-based identifier of the correct answer option.
  /// Available only for polls in the quiz mode, which are closed, or was sent
  /// (not forwarded) by the bot or to the private chat with the bot.
  int? correctOptionId;

  /// Optional.
  /// Text that is shown when a user chooses an incorrect answer or taps on the
  /// lamp icon in a quiz-style poll, 0-200 characters
  String? explanation;

  /// Optional.
  /// Special entities like usernames, URLs, bot commands, etc. that appear in
  /// the explanation
  List<MessageEntity>? explanationEntities;

  /// Optional.
  /// Amount of time in seconds the poll will be active after creation
  int? openPeriod;

  /// Optional.
  /// Point in time (Unix timestamp) when the poll will be automatically closed
  int? closeDate;

  /// Basic constructor
  Poll({
    required this.id,
    required this.question,
    required this.options,
    required this.totalVoterCount,
    required this.isClosed,
    required this.isAnonymous,
    required this.type,
    required this.allowsMultipleAnswers,
    this.correctOptionId,
    this.explanation,
    this.explanationEntities,
    this.openPeriod,
    this.closeDate,
  });

  /// Creates a object from a json
  static Poll fromJson(Map<String, dynamic> json) {
    return Poll(
      id: json['id']!,
      question: json['question']!,
      options: PollOption.listFromJsonArray(json['options']!),
      totalVoterCount: json['total_voter_count']!,
      isClosed: json['is_closed']!,
      isAnonymous: json['is_anonymous']!,
      type: PollType.forValue(json['type']),
      allowsMultipleAnswers: json['allows_multiple_answers']!,
      correctOptionId: json['correct_option_id'],
      explanation: json['explanation'],
      explanationEntities: callIfNotNull(
        MessageEntity.listFromJsonArray,
        json['explanation_entities'],
      ),
      openPeriod: json['open_period'],
      closeDate: json['close_date'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'id': id,
      'question': question,
      'options': options,
      'total_voter_count': totalVoterCount,
      'is_closed': isClosed,
      'is_anonymous': isAnonymous,
      'type': type,
      'allows_multiple_answers': allowsMultipleAnswers,
      'correct_option_id': correctOptionId,
      'explanation': explanation,
      'explanation_entities': explanationEntities,
      'open_period': openPeriod,
      'close_date': closeDate,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
