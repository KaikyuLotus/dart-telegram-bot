part of '../../entities.dart';

class LabeledPrice {
  String label;
  int amount;

  LabeledPrice({this.label, this.amount});

  factory LabeledPrice.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return LabeledPrice(label: json['label'], amount: json['amount']);
  }

  static List<LabeledPrice> listFromJsonArray(List<dynamic> json) {
    if (json == null) return null;
    return List.generate(json.length, (i) => LabeledPrice.fromJson(json[i]));
  }
}
