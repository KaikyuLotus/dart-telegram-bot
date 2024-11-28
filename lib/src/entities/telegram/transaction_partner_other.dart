import 'dart:convert';

import '../../../telegram_entities.dart';

/// Describes a transaction with an unknown source or recipient.
class TransactionPartnerOther extends TransactionPartner {
  /// Type of the transaction partner, always “other”
  @override
  String type = 'other';

  /// Basic constructor
  TransactionPartnerOther();

  /// Creates an object from a json
  factory TransactionPartnerOther.fromJson(Map<String, dynamic> _) {
    return TransactionPartnerOther();
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
