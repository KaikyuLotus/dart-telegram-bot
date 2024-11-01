import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// This object contains information about one answer option in a poll.
class PollOption {
  /// Option text, 1-100 characters
  String text;

  /// Optional.
  /// Special entities that appear in the option text.
  /// Currently, only custom emoji entities are allowed in poll option texts
  List<MessageEntity>? textEntities;

  /// Number of users that voted for this option
  int voterCount;

  /// Basic constructor
  PollOption({
    required this.text,
    this.textEntities,
    required this.voterCount,
  });

  /// Creates a object from a json
  factory PollOption.fromJson(Map<String, dynamic> json) {
    return PollOption(
      text: json['text'],
      textEntities: callIfNotNull(
        MessageEntity.listFromJsonArray,
        json['text_entities'],
      ),
      voterCount: json['voter_count'],
    );
  }

  /// Creates a list of object from a json array
  static List<PollOption> listFromJsonArray(List<dynamic> json) {
    return List.generate(json.length, (i) => PollOption.fromJson(json[i]));
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'text': text,
      'text_entities': textEntities,
      'voter_count': voterCount,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
