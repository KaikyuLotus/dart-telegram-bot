import 'package:dart_telegram_bot/telegram_entities.dart';

class ShippingQuery {
  String id;
  User from;
  String invoicePayload;
  ShippingAddress shippingAddress;

  ShippingQuery({this.id, this.from, this.invoicePayload, this.shippingAddress});

  factory ShippingQuery.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return ShippingQuery(
      id: json['id'],
      from: json['from'],
      invoicePayload: json['invoice_payload'],
      shippingAddress: json['shipping_address'],
    );
  }
}
