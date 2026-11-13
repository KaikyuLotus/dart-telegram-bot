import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// Describes a Telegram Star transaction.
/// Note that if the buyer initiates a chargeback with the payment provider from
/// whom they acquired Stars (e.g., Apple, Google) following this transaction,
/// the refunded Stars will be deducted from the bot's balance.
///
/// This is outside of Telegram's control.
class StarTransaction {
  /// Unique identifier of the transaction.
  ///
  /// Coincides with the identifier of the original transaction for
  /// refund transactions.
  ///
  /// Coincides with `SuccessfulPayment.telegram_payment_charge_id` for
  /// successful incoming payments from users.
  String id;

  /// Integer amount of Telegram Stars transferred by the transaction
  int amount;

  /// Optional.
  /// The number of 1/1000000000 shares of Telegram Stars transferred by the
  /// transaction; from 0 to 999999999
  int? nanostarAmount;

  /// Date the transaction was created in Unix time
  int date;

  /// Optional.
  /// Source of an incoming transaction (e.g., a user purchasing goods or
  /// services, Fragment refunding a failed withdrawal).
  ///
  /// Only for incoming transactions
  TransactionPartner? source;

  /// Optional.
  /// Receiver of an outgoing transaction (e.g., a user for a purchase refund,
  /// Fragment for a withdrawal).
  ///
  /// Only for outgoing transactions
  TransactionPartner? receiver;

  /// Basic constructor
  StarTransaction({
    required this.id,
    required this.amount,
    this.nanostarAmount,
    required this.date,
    this.source,
    this.receiver,
  });

  /// Creates an object from a json
  factory StarTransaction.fromJson(Map<String, dynamic> json) {
    return StarTransaction(
      id: json['id'],
      amount: json['amount'],
      nanostarAmount: json['nanostar_amount'],
      date: json['date'],
      source: callIfNotNull(TransactionPartner.fromJson, json['source']),
      receiver: callIfNotNull(TransactionPartner.fromJson, json['receiver']),
    );
  }

  /// Creates a list of objects from a json array
  static List<StarTransaction> listFromJsonArray(List<dynamic> json) {
    return List.generate(json.length, (i) => StarTransaction.fromJson(json[i]));
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'amount': amount,
      'nanostar_amount': nanostarAmount,
      'date': date,
      'source': source,
      'receiver': receiver,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
