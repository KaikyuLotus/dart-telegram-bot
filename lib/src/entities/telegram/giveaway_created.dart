import 'dart:convert';

/// This object represents a service message about the creation of a scheduled
/// giveaway.
class GiveawayCreated {
  /// The number of Telegram Stars to be split between giveaway winners;
  /// for Telegram Star giveaways only
  int? prizeStarCount;

  /// Basic constructor
  GiveawayCreated({
    this.prizeStarCount,
  });

  /// Creates a object from json
  factory GiveawayCreated.fromJson(Map<String, dynamic> json) {
    return GiveawayCreated(
      prizeStarCount: json['prize_star_count'],
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'prize_star_count': prizeStarCount,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
