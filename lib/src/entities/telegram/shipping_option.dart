import 'dart:convert';

import '../../../telegram_entities.dart';

/// This object represents one shipping option.
class ShippingOption {
  /// Shipping option identifier
  String id;

  /// Option title
  String title;

  /// List of price portions
  List<LabeledPrice> prices;

  /// Basic constructor
  ShippingOption({
    required this.id,
    required this.title,
    required this.prices,
  });

  /// Creates a object from a json
  static ShippingOption fromJson(Map<String, dynamic> json) {
    return ShippingOption(
      id: json['id']!,
      title: json['title']!,
      prices: LabeledPrice.listFromJsonArray(json['prices']!),
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'id': id,
      'title': title,
      'prices': prices,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
