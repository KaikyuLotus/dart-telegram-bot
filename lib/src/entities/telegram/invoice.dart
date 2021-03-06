import 'dart:convert';

class Invoice {
  String title;
  String description;
  String startParameter;
  String currency;
  int totalAmount;

  Invoice({
    required this.title,
    required this.description,
    required this.startParameter,
    required this.currency,
    required this.totalAmount,
  });

  static Invoice fromJson(Map<String, dynamic> json) {
    return Invoice(
      title: json['title']!,
      description: json['description']!,
      startParameter: json['start_parameter']!,
      currency: json['currency']!,
      totalAmount: json['total_amount']!,
    );
  }

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
