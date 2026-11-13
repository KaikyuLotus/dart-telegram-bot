import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// Describes the affiliate program that issued the affiliate commission
/// received via this transaction.
class TransactionPartnerAffiliateProgram extends TransactionPartner {
  /// Type of the transaction partner, always "affiliate_program"
  @override
  String type = 'affiliate_program';

  /// Optional.
  /// Information about the bot that sponsored the affiliate program
  User? sponsorUser;

  /// The number of Telegram Stars received by the bot for each 1000 Telegram
  /// Stars received by the affiliate program sponsor from referred users
  int commissionPerMille;

  /// Basic constructor
  TransactionPartnerAffiliateProgram({
    this.sponsorUser,
    required this.commissionPerMille,
  });

  /// Creates an object from a json
  factory TransactionPartnerAffiliateProgram.fromJson(
    Map<String, dynamic> json,
  ) {
    return TransactionPartnerAffiliateProgram(
      sponsorUser: callIfNotNull(User.fromJson, json['sponsor_user']),
      commissionPerMille: json['commission_per_mille'],
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'sponsor_user': sponsorUser,
      'commission_per_mille': commissionPerMille,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
