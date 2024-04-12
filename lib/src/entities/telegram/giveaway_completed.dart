import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// This object represents a service message about the completion of a
/// giveaway without public winners.
class GiveawayCompleted {
  /// Number of winners in the giveaway
  int winnerCount;

  /// Optional.
  /// Number of undistributed prizes
  int? unclaimedPrizeCount;

  /// Optional.
  /// Message with the giveaway that was completed, if it wasn't deleted
  Message? giveawayMessage;

  /// Basic constructor
  GiveawayCompleted({
    required this.winnerCount,
    this.unclaimedPrizeCount,
    this.giveawayMessage,
  });

  /// Creates a object from a json
  factory GiveawayCompleted.fromJson(Map<String, dynamic> json) {
    return GiveawayCompleted(
      winnerCount: json['winner_count'],
      unclaimedPrizeCount: json['unclaimed_prize_count'],
      giveawayMessage: callIfNotNull(
        Message.fromJson,
        json['giveaway_message'],
      ),
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'winner_count': winnerCount,
      'unclaimed_prize_count': unclaimedPrizeCount,
      'giveaway_message': giveawayMessage,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
