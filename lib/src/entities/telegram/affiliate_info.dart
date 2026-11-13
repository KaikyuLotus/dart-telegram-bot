import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// Contains information about the affiliate that received a commission via
/// this transaction.
class AffiliateInfo {
  /// Optional.
  /// The bot or the user that received an affiliate commission if it was
  /// received by a bot or a user
  User? affiliateUser;

  /// Optional.
  /// The chat that received an affiliate commission if it was received by a
  /// chat
  Chat? affiliateChat;

  /// The number of Telegram Stars received by the
  /// affiliate for each 1000 Telegram Stars received by the bot from referred
  /// users
  int commissionPerMille;

  /// Integer amount of Telegram Stars received by
  /// the affiliate from the transaction, rounded to 0; can be negative for
  /// refunds
  int amount;

  /// Optional.
  /// The number of 1/1000000000 shares of Telegram Stars received by the
  /// affiliate; from -999999999 to 999999999; can be negative for refunds
  int? nanostarAmount;

  /// Basic constructor
  AffiliateInfo({
    this.affiliateUser,
    this.affiliateChat,
    required this.commissionPerMille,
    required this.amount,
    this.nanostarAmount,
  });

  /// Creates an object from a json
  factory AffiliateInfo.fromJson(Map<String, dynamic> json) {
    return AffiliateInfo(
      affiliateUser: callIfNotNull(User.fromJson, json['affiliate_user']),
      affiliateChat: callIfNotNull(Chat.fromJson, json['affiliate_chat']),
      commissionPerMille: json['commission_per_mille'],
      amount: json['amount'],
      nanostarAmount: json['nanostar_amount'],
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'affiliate_user': affiliateUser,
      'affiliate_chat': affiliateChat,
      'commission_per_mille': commissionPerMille,
      'amount': amount,
      'nanostar_amount': nanostarAmount,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
