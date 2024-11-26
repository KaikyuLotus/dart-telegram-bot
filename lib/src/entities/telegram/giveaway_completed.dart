import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// This object represents a service message about the completion of a
/// giveaway without public winners.
class GiveawayCompleted {
  /// Number of winners in the giveaway
  int winnerCount;

  /// Number of undistributed prizes
  int? unclaimedPrizeCount;

  /// Message with the giveaway that was completed, if it wasn't deleted
  Message? giveawayMessage;

  /// True, if the giveaway is a Telegram Star giveaway.
  ///
  /// Otherwise, currently, the giveaway is a Telegram Premium giveaway.
  bool? isStarGiveaway;

  /// Basic constructor
  GiveawayCompleted({
    required this.winnerCount,
    this.unclaimedPrizeCount,
    this.giveawayMessage,
    this.isStarGiveaway,
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
      isStarGiveaway: json['is_star_giveaway'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'winner_count': winnerCount,
      'unclaimed_prize_count': unclaimedPrizeCount,
      'giveaway_message': giveawayMessage,
      'is_star_giveaway': isStarGiveaway,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
