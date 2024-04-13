import 'dart:convert';
import '../../../telegram_entities.dart';

/// This object represents a message about the completion of a giveaway with
/// public winners.
class GiveawayWinners {
  /// The chat that created the giveaway
  Chat chat;

  /// Identifier of the messsage with the giveaway in the chat
  int giveawayMessageId;

  /// Point in time (Unix timestamp) when winners of the giveaway were
  /// selected
  int winnersSelectionDate;

  /// Total number of winners in the giveaway
  int winnerCount;

  /// List of up to 100 winners of the giveaway
  List<User> winners;

  /// Optional.
  /// The number of other chats the user had to join in order to be eligible
  /// for the giveaway
  int? additionalChatCount;

  /// Optional.
  /// The number of months the Telegram Premium subscription won from the
  /// giveaway will be active for
  int? premiumSubscriptionMonthCount;

  /// Optional.
  /// Number of undistributed prizes
  int? unclaimedPrizeCount;

  /// Optional.
  /// True, if only users who had joined the chats after the giveaway started
  /// were eligible to win
  bool? onlyNewMembers;

  /// Optional.
  /// True, if the giveaway was canceled because the payment for it was refunded
  bool? wasRefunded;

  /// Optional.
  /// Description of additional giveaway prize
  String? prizeDescription;

  /// Basic constructor
  GiveawayWinners({
    required this.chat,
    required this.giveawayMessageId,
    required this.winnersSelectionDate,
    required this.winnerCount,
    required this.winners,
    this.additionalChatCount,
    this.premiumSubscriptionMonthCount,
    this.unclaimedPrizeCount,
    this.onlyNewMembers,
    this.wasRefunded,
    this.prizeDescription,
  });

  /// Creates a object from a json
  factory GiveawayWinners.fromJson(Map<String, dynamic> json) {
    return GiveawayWinners(
      chat: Chat.fromJson(json['chat']),
      giveawayMessageId: json['giveaway_message_id'],
      winnersSelectionDate: json['winners_selection_date'],
      winnerCount: json['winner_count'],
      winners: User.listFromJsonArray(json['winners']),
      additionalChatCount: json['additional_chat_count'],
      premiumSubscriptionMonthCount: json['premium_subscription_month_count'],
      unclaimedPrizeCount: json['unclaimed_prize_count'],
      onlyNewMembers: json['only_new_members'],
      wasRefunded: json['was_refunded'],
      prizeDescription: json['prize_description'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'chat': chat,
      'giveaway_message_id': giveawayMessageId,
      'winners_selection_date': winnersSelectionDate,
      'winner_count': winnerCount,
      'winners': winners,
      'additional_chat_count': additionalChatCount,
      'premium_subscription_month_count': premiumSubscriptionMonthCount,
      'unclaimed_prize_count': unclaimedPrizeCount,
      'only_new_members': onlyNewMembers,
      'was_refunded': wasRefunded,
      'prize_description': prizeDescription,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
