import 'dart:convert';

/// This object represents a portion of the price for goods or services.
class LabeledPrice {
  /// Portion label
  String label;

  /// Price of the product in the smallest units of the currency
  /// (integer, not float/double).
  /// For example, for a price of US$ 1.45 pass amount = 145.
  /// See the exp parameter in currencies.json, it shows the number of digits
  /// past the decimal point for each currency
  /// (2 for the majority of currencies).
  int amount;

  /// Basic constructor
  LabeledPrice({
    required this.label,
    required this.amount,
  });

  /// Creates a object from a json
  static LabeledPrice fromJson(Map<String, dynamic> json) {
    return LabeledPrice(
      label: json['label']!,
      amount: json['amount']!,
    );
  }

  /// Creates a list of object from a json array
  static List<LabeledPrice> listFromJsonArray(List<dynamic> json) {
    return List.generate(
      json.length,
      (i) => LabeledPrice.fromJson(json[i]),
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'label': label,
      'amount': amount,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
