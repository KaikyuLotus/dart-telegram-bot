import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// The boost was obtained by the creation of a Telegram Premium
/// or a Telegram Star giveaway.
///
/// This boosts the chat 4 times for the duration of the corresponding
/// Telegram Premium subscription for Telegram Premium giveaways
/// and *prize_star_count* / 500 times for one year for Telegram Star giveaways.
class ChatBoostSourceGiveaway extends ChatBoostSource {
  /// Source of the boost, always “giveaway”
  @override
  final String source = 'giveaway';

  /// Identifier of a message in the chat with the giveaway;
  /// the message could have been deleted already.
  ///
  /// May be 0 if the message isn't sent yet.
  int giveawayMessageId;

  /// User that won the prize in the giveaway if any;
  /// for Telegram Premium giveaways only
  User? user;

  /// The number of Telegram Stars to be split between giveaway winners;
  /// for Telegram Star giveaways only
  int? prizeStarCount;

  /// True, if the giveaway was completed,
  /// but there was no user to win the prize
  bool? isUnclaimed;

  /// Basic constructor
  ChatBoostSourceGiveaway({
    required this.giveawayMessageId,
    this.user,
    this.prizeStarCount,
    this.isUnclaimed,
  });

  /// Creates an object from a json
  factory ChatBoostSourceGiveaway.fromJson(Map<String, dynamic> json) {
    return ChatBoostSourceGiveaway(
      giveawayMessageId: json['giveaway_message_id'],
      user: callIfNotNull(User.fromJson, json['user']),
      prizeStarCount: json['prize_star_count'],
      isUnclaimed: json['is_unclaimed'],
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'source': source,
      'giveaway_message_id': giveawayMessageId,
      'user': user,
      'prize_star_count': prizeStarCount,
      'is_unclaimed': isUnclaimed,
    };
  }

  @override
  String toString() => json.encode(this);
}
