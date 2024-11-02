import 'dart:convert';

import '../../../telegram_entities.dart';

/// Describes a transaction with a user.
class TransactionPartnerUser extends TransactionPartner {
  /// Type of the transaction partner, always “user”
  @override
  String type = 'user';

  /// Information about the user
  User user;

  /// Basic constructor
  TransactionPartnerUser({
    required this.user,
  });

  /// Creates a object from a json
  factory TransactionPartnerUser.fromJson(Map<String, dynamic> json) {
    return TransactionPartnerUser(
      user: User.fromJson(json['user']),
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'type': type,
      'user': user,
    };
  }

  @override
  String toString() => json.encode(this);
}
