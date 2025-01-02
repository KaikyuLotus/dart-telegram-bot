import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// Describes a withdrawal transaction with Fragment.
class TransactionPartnerFragment extends TransactionPartner {
  /// Type of the transaction partner, always “fragment”
  @override
  String type = 'fragment';

  /// State of the transaction if the transaction is outgoing
  RevenueWithdrawalState? withdrawalState;

  /// Basic constructor
  TransactionPartnerFragment({
    this.withdrawalState,
  });

  /// Creates an object from a json
  factory TransactionPartnerFragment.fromJson(Map<String, dynamic> json) {
    return TransactionPartnerFragment(
      withdrawalState: callIfNotNull(
        RevenueWithdrawalState.fromJson,
        json['withdrawal_state'],
      ),
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'withdrawal_state': withdrawalState,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
