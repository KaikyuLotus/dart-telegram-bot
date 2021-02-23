import 'package:dart_telegram_bot/telegram_entities.dart';

class ShippingOption {
  String id;
  String title;
  List<LabeledPrice> prices;

  ShippingOption({this.id, this.title, this.prices});

  factory ShippingOption.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return ShippingOption(
      id: json['id'],
      title: json['title'],
      prices: LabeledPrice.listFromJsonArray(json['prices']),
    );
  }
}
