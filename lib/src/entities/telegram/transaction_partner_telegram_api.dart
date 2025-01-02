import 'dart:convert';

import '../../../telegram_entities.dart';

/// Describes a transaction with payment for paid broadcasting.
class TransactionPartnerTelegramApi extends TransactionPartner {
  /// Type of the transaction partner, always “telegram_api”
  @override
  String type = 'telegram_api';

  /// The number of successful requests that exceeded regular limits and were
  /// therefore billed
  int requestCount;

  /// Basic constructor
  TransactionPartnerTelegramApi(this.requestCount);

  /// Creates an object from a json
  factory TransactionPartnerTelegramApi.fromJson(Map<String, dynamic> json) {
    return TransactionPartnerTelegramApi(json['request_count']);
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'request_count': requestCount,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
