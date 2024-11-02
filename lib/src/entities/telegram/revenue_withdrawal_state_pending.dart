import 'dart:convert';

import '../../../telegram_entities.dart';

/// The withdrawal is in progress.
class RevenueWithdrawalStatePending extends RevenueWithdrawalState {
  /// Type of the state, always “pending”
  @override
  String type = 'pending';

  /// Basic constructor
  RevenueWithdrawalStatePending();

  /// Creates a object from a json
  factory RevenueWithdrawalStatePending.fromJson(Map<String, dynamic> _) {
    return RevenueWithdrawalStatePending();
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
