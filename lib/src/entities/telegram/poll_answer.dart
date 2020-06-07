part of '../../entities.dart';

class PollAnswer {
  String pollId;
  User user;
  List<int> optionIds;

  PollAnswer({this.pollId, this.user, this.optionIds});

  factory PollAnswer.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return PollAnswer(pollId: json['poll_id'], user: json['user'], optionIds: json['option_ids']);
  }
}
