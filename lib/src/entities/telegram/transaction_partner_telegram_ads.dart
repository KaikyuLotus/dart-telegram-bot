import 'dart:convert';

import '../../../telegram_entities.dart';

/// Describes a withdrawal transaction to the Telegram Ads platform.
class TransactionPartnerTelegramAds extends TransactionPartner {
  /// Type of the transaction partner, always “telegram_ads”
  @override
  String type = 'telegram_ads';

  /// Basic constructor
  TransactionPartnerTelegramAds();

  /// Creates a object from a json
  factory TransactionPartnerTelegramAds.fromJson(Map<String, dynamic> _) {
    return TransactionPartnerTelegramAds();
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'type': type,
    };
  }

  @override
  String toString() => json.encode(this);
}
