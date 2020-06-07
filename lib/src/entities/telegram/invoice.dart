part of '../../entities.dart';

class Invoice {
  String title;
  String description;
  String startParameter;
  String currency;
  int totalAmount;

  Invoice({this.title, this.description, this.startParameter, this.currency, this.totalAmount});

  factory Invoice.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return Invoice(
        title: json['title'],
        description: json['description'],
        startParameter: json['start_parameter'],
        currency: json['currency'],
        totalAmount: json['total_amount']);
  }
}
