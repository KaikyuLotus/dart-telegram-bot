import 'dart:convert';

/// Describes an amount of Telegram Stars.
class StarAmount {
  /// Integer amount of Telegram Stars, rounded to 0; can be negative
  int amount;

  /// Optional.
  /// The number of 1/1000000000 shares of Telegram Stars; from -999999999 to
  /// 999999999; can be negative if and only if amount is non-positive
  int? nanostarAmount;

  /// Basic constructor
  StarAmount({
    required this.amount,
    this.nanostarAmount,
  });

  /// Creates an object from a json
  factory StarAmount.fromJson(Map<String, dynamic> json) {
    return StarAmount(
      amount: json['amount'],
      nanostarAmount: json['nanostar_amount'],
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'nanostar_amount': nanostarAmount,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
