import 'package:dart_telegram_bot/telegram_entities.dart';

class ShippingQuery {
  String id;
  User from;
  String invoicePayload;
  ShippingAddress shippingAddress;

  ShippingQuery({
    required this.id,
    required this.from,
    required this.invoicePayload,
    required this.shippingAddress,
  });

  static ShippingQuery fromJson(Map<String, dynamic> json) {
    return ShippingQuery(
      id: json['id']!,
      from: json['from']!,
      invoicePayload: json['invoice_payload']!,
      shippingAddress: json['shipping_address']!,
    );
  }
}
