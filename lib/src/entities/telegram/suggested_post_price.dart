import 'dart:convert';

/// Describes the price of a suggested post.
class SuggestedPostPrice {
  /// Currency in which the post will be paid.
  ///
  /// Currently, must be one of "XTR" for Telegram Stars or "TON" for TON grams.
  String currency;

  /// The amount of the currency that will be paid for the post in the smallest
  /// units of the currency, i.e. Telegram Stars or nanograms.
  ///
  /// Currently, price in Telegram Stars must be between 5 and 100000, and
  /// price in nanograms must be between 10000000 and 10000000000000.
  int amount;

  /// Basic constructor
  SuggestedPostPrice({
    required this.currency,
    required this.amount,
  });

  /// Creates an object from a json
  factory SuggestedPostPrice.fromJson(Map<String, dynamic> json) {
    return SuggestedPostPrice(
      currency: json['currency'],
      amount: json['amount'],
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'currency': currency,
      'amount': amount,
    };
  }

  @override
  String toString() => json.encode(this);
}
