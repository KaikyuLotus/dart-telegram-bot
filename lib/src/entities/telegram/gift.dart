import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// This object represents a gift that can be sent by the bot.
class Gift {
  /// Unique identifier of the gift
  String id;

  /// The sticker that represents the gift
  Sticker sticker;

  /// The number of Telegram Stars that must be paid
  /// to send the sticker
  int starCount;

  /// Optional.
  /// The number of Telegram Stars that must be paid
  /// to upgrade the gift to a unique one
  int? upgradeStarCount;

  /// Optional.
  /// True, if the gift can only be purchased by Telegram Premium subscribers
  bool? isPremium;

  /// Optional.
  /// True, if the gift can be used (after being upgraded) to customize a user's
  /// appearance
  bool? hasColors;

  /// Optional.
  /// The total number of gifts of this type that can be sent by all users; for
  /// limited gifts only
  int? totalCount;

  /// Optional.
  /// The number of remaining gifts of this type that can be sent by all users;
  /// for limited gifts only
  int? remainingCount;

  /// Optional.
  /// The total number of gifts of this type that can be sent by the bot; for
  /// limited gifts only
  int? personalTotalCount;

  /// Optional.
  /// The number of remaining gifts of this type that can be sent by the bot;
  /// for limited gifts only
  int? personalRemainingCount;

  /// Optional.
  /// Background of the gift
  GiftBackground? background;

  /// Optional.
  /// The total number of different unique gifts that can be obtained by
  /// upgrading the gift
  int? uniqueGiftVariantCount;

  /// Optional.
  /// Information about the chat that published the gift
  Chat? publisherChat;

  /// Basic constructor
  Gift({
    required this.id,
    required this.sticker,
    required this.starCount,
    this.upgradeStarCount,
    this.isPremium,
    this.hasColors,
    this.totalCount,
    this.remainingCount,
    this.personalTotalCount,
    this.personalRemainingCount,
    this.background,
    this.uniqueGiftVariantCount,
    this.publisherChat,
  });

  /// Creates an object from a json
  factory Gift.fromJson(Map<String, dynamic> json) {
    return Gift(
      id: json['id'],
      sticker: Sticker.fromJson(json['sticker']),
      starCount: json['star_count'],
      upgradeStarCount: json['upgrade_star_count'],
      isPremium: json['is_premium'],
      hasColors: json['has_colors'],
      totalCount: json['total_count'],
      remainingCount: json['remaining_count'],
      personalTotalCount: json['personal_total_count'],
      personalRemainingCount: json['personal_remaining_count'],
      background: callIfNotNull(GiftBackground.fromJson, json['background']),
      uniqueGiftVariantCount: json['unique_gift_variant_count'],
      publisherChat: callIfNotNull(Chat.fromJson, json['publisher_chat']),
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sticker': sticker,
      'star_count': starCount,
      'upgrade_star_count': upgradeStarCount,
      'is_premium': isPremium,
      'has_colors': hasColors,
      'total_count': totalCount,
      'remaining_count': remainingCount,
      'personal_total_count': personalTotalCount,
      'personal_remaining_count': personalRemainingCount,
      'background': background,
      'unique_gift_variant_count': uniqueGiftVariantCount,
      'publisher_chat': publisherChat,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
