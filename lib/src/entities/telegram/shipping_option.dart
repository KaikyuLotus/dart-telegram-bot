import 'package:dart_telegram_bot/telegram_entities.dart';

class ShippingOption {
  String id;
  String title;
  List<LabeledPrice> prices;

  ShippingOption({
    required this.id,
    required this.title,
    required this.prices,
  });

  static ShippingOption fromJson(Map<String, dynamic> json) {
    return ShippingOption(
      id: json['id']!,
      title: json['title']!,
      prices: LabeledPrice.listFromJsonArray(json['prices']!),
    );
  }
}
