import 'dart:convert';

import 'package:dart_telegram_bot/dart_telegram_bot.dart';
import 'package:dart_telegram_bot/src/entities/internal/helpers/util.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';

class Poll {
  String id;
  String question;
  List<PollOption> options;
  int totalVoterCount;
  bool isClosed;
  bool isAnonymous;
  PollType type;
  bool allowsMultipleAnswers;
  int? correctOptionId;
  String? explanation;
  List<MessageEntity>? explanationEntities;
  int? openPeriod;
  int? closeDate;

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

  static Poll fromJson(Map<String, dynamic> json) {
    return Poll(
      id: json['id']!,
      question: json['question']!,
      options: PollOption.listFromJsonArray(json['options']!),
      totalVoterCount: json['total_voter_count']!,
      isClosed: json['is_closed']!,
      isAnonymous: json['is_anonymous']!,
      type: EnumHelper.decode(PollType.values, json['type']!),
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

  Map toJson() {
    return {
      'id': id,
      'question': question,
      'options': options,
      'total_voter_count': totalVoterCount,
      'is_closed': isClosed,
      'is_anonymous': isAnonymous,
      'type': EnumHelper.encode(type),
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
