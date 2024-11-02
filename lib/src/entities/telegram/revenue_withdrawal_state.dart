import '../../../telegram_entities.dart';

/// This object describes the state of a revenue withdrawal operation.
///
/// Currently, it can be one of
/// [RevenueWithdrawalStatePending],
/// [RevenueWithdrawalStateSucceeded],
/// [RevenueWithdrawalStateFailed]
abstract class RevenueWithdrawalState {
  abstract final String type;

  static RevenueWithdrawalState fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case 'pending':
        return RevenueWithdrawalStatePending.fromJson(json);
      case 'succeeded':
        return RevenueWithdrawalStateSucceeded.fromJson(json);
      case 'failed':
        return RevenueWithdrawalStateFailed.fromJson(json);
      default:
        throw Exception('RevenueWithdrawalState type not recognized');
    }
  }
}
