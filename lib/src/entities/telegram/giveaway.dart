import 'dart:convert';
import '../../../telegram_entities.dart';

/// This object represents a message about a scheduled giveaway.
class Giveaway {
  /// The list of chats which the user must join to participate in the giveaway
  List<Chat> chats;

  /// Point in time (Unix timestamp) when winners of the giveaway will
  /// be selected
  int winnersSelectionDate;

  /// The number of users which are supposed to be selected as winners
  /// of the giveaway
  int winnerCount;

  /// True, if only users who join the chats after the giveaway started
  /// should be eligible to win
  bool? onlyNewMembers;

  /// True, if the list of giveaway winners will be visible to everyone
  bool? hasPublicWinners;

  /// Description of additional giveaway prize
  String? prizeDescription;

  /// A list of two-letter [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)
  /// country codes indicating the countries from which eligible users for the
  /// giveaway must come.
  ///
  /// If empty, then all users can participate in the giveaway.
  ///
  /// Users with a phone number that was bought on Fragment can always
  /// participate in giveaways.
  List<String>? countryCodes;

  /// The number of Telegram Stars to be split between giveaway winners;
  /// for Telegram Star giveaways only
  int? prizeStarCount;

  /// The number of months the Telegram Premium subscription won from the
  /// giveaway will be active for; for Telegram Premium giveaways only
  int? premiumSubscriptionMonthCount;

  /// Basic constructor
  Giveaway({
    required this.chats,
    required this.winnersSelectionDate,
    required this.winnerCount,
    this.onlyNewMembers,
    this.hasPublicWinners,
    this.prizeDescription,
    this.countryCodes,
    this.prizeStarCount,
    this.premiumSubscriptionMonthCount,
  });

  /// Creates an object from a json
  factory Giveaway.fromJson(Map<String, dynamic> json) {
    return Giveaway(
      chats: Chat.listFromJsonArray(json['chats']),
      winnersSelectionDate: json['winners_selection_date'],
      winnerCount: json['winner_count'],
      onlyNewMembers: json['only_new_members'],
      hasPublicWinners: json['has_public_winners'],
      prizeDescription: json['prize_description'],
      countryCodes: List.from(json['country_codes'] ?? []),
      prizeStarCount: json['prize_star_count'],
      premiumSubscriptionMonthCount: json['premium_subscription_month_count'],
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'chats': chats,
      'winners_selection_date': winnersSelectionDate,
      'winner_count': winnerCount,
      'only_new_members': onlyNewMembers,
      'has_public_winners': hasPublicWinners,
      'prize_description': prizeDescription,
      'country_codes': countryCodes,
      'prize_star_count': prizeStarCount,
      'premium_subscription_month_count': premiumSubscriptionMonthCount,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
