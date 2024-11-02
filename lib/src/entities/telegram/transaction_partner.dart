import '../../../telegram_entities.dart';

/// This object describes the source of a transaction,
/// or its recipient for outgoing transactions.
///
/// Currently, it can be one of
/// [TransactionPartnerUser],
/// [TransactionPartnerFragment],
/// [TransactionPartnerOther]
abstract class TransactionPartner {
  abstract final String type;

  static TransactionPartner fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case 'user':
        return TransactionPartnerUser.fromJson(json);
      case 'fragment':
        return TransactionPartnerFragment.fromJson(json);
      case 'other':
        return TransactionPartnerOther.fromJson(json);
      default:
        throw Exception('TransactionPartner type not recognized');
    }
  }
}
