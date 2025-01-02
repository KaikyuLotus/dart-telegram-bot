import 'dart:convert';

import '../../../telegram_entities.dart';

/// The withdrawal failed and the transaction was refunded.
class RevenueWithdrawalStateFailed extends RevenueWithdrawalState {
  /// Type of the state, always “failed”
  @override
  String type = 'failed';

  /// Basic constructor
  RevenueWithdrawalStateFailed();

  /// Creates an object from a json
  factory RevenueWithdrawalStateFailed.fromJson(Map<String, dynamic> _) {
    return RevenueWithdrawalStateFailed();
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'type': type,
    };
  }

  @override
  String toString() => json.encode(this);
}
