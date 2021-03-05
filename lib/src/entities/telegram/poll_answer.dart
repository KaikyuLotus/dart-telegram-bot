import 'package:dart_telegram_bot/telegram_entities.dart';

class PollAnswer {
  String pollId;
  User user;
  List<int> optionIds;

  PollAnswer({
    required this.pollId,
    required this.user,
    required this.optionIds,
  });

  static PollAnswer fromJson(Map<String, dynamic> json) {
    return PollAnswer(
      pollId: json['poll_id']!,
      user: json['user']!,
      optionIds: json['option_ids']!,
    );
  }
}
