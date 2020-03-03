import 'poll_option.dart';

class Poll {
  String id;
  String question;
  List<PollOption> options;
  int totalVoterCount;
  bool isClosed;
  bool isAnonymous;
  String type;
  bool allowsMultipleAnswers;
  int correctOptionId;

  Poll(
      {this.id,
      this.question,
      this.options,
      this.totalVoterCount,
      this.isClosed,
      this.isAnonymous,
      this.type,
      this.allowsMultipleAnswers,
      this.correctOptionId});

  factory Poll.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return Poll(
        id: json['id'],
        question: json['question'],
        options: PollOption.listFromJsonArray(json['options']),
        totalVoterCount: json['total_voter_count'],
        isClosed: json['is_closed'],
        isAnonymous: json['is_anonymous'],
        type: json['type'],
        allowsMultipleAnswers: json['allows_multiple_answers'],
        correctOptionId: json['correct_option_id']);
  }
}
