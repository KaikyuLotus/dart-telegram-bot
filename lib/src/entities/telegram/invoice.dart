import 'dart:convert';

/// This object contains basic information about an invoice.
class Invoice {
  /// Product name
  String title;

  /// Product description
  String description;

  /// Unique bot deep-linking parameter that can be used to generate this
  /// invoice
  String startParameter;

  /// Three-letter ISO 4217 currency code
  String currency;

  /// Total price in the smallest units of the currency
  /// (integer, not float/double). For example, for a price of US$ 1.45 pass
  /// amount = 145.
  /// See the exp parameter in currencies.json,
  /// it shows the number of digits past the decimal point for each currency
  /// (2 for the majority of currencies).
  int totalAmount;

  /// Basic constructor
  Invoice({
    required this.title,
    required this.description,
    required this.startParameter,
    required this.currency,
    required this.totalAmount,
  });

  /// Creates a object from a json
  static Invoice fromJson(Map<String, dynamic> json) {
    return Invoice(
      title: json['title']!,
      description: json['description']!,
      startParameter: json['start_parameter']!,
      currency: json['currency']!,
      totalAmount: json['total_amount']!,
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'title': title,
      'description': description,
      'start_parameter': startParameter,
      'currency': currency,
      'total_amount': totalAmount,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
