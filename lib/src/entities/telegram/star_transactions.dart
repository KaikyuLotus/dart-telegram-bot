import 'dart:convert';

import '../../../telegram_entities.dart';

/// Contains a list of Telegram Star transactions.
class StarTransactions {
  /// The list of transactions
  List<StarTransaction> transactions;

  /// Basic constructor
  StarTransactions({
    required this.transactions,
  });

  /// Creates an object from a json
  factory StarTransactions.fromJson(Map<String, dynamic> json) {
    return StarTransactions(
      transactions: StarTransaction.listFromJsonArray(json['transactions']),
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'transactions': transactions,
    };
  }

  @override
  String toString() => json.encode(this);
}
