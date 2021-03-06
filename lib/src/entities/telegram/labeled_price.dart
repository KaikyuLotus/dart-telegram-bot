import 'dart:convert';

class LabeledPrice {
  String label;
  int amount;

  LabeledPrice({
    required this.label,
    required this.amount,
  });

  static LabeledPrice fromJson(Map<String, dynamic> json) {
    return LabeledPrice(
      label: json['label']!,
      amount: json['amount']!,
    );
  }

  static List<LabeledPrice> listFromJsonArray(List<dynamic> json) {
    return List.generate(
      json.length,
      (i) => LabeledPrice.fromJson(json[i]),
    );
  }

  Map toJson() {
    return {
      'label': label,
      'amount': amount,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
