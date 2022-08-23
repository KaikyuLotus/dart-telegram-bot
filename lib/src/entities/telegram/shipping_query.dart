import 'dart:convert';

import '../../../telegram_entities.dart';

/// This object contains information about an incoming shipping query.
class ShippingQuery {
  /// Unique query identifier
  String id;

  /// User who sent the query
  User from;

  /// Bot specified invoice payload
  String invoicePayload;

  /// User specified shipping address
  ShippingAddress shippingAddress;

  /// Basic constructor
  ShippingQuery({
    required this.id,
    required this.from,
    required this.invoicePayload,
    required this.shippingAddress,
  });

  /// Creates a object from a json
  static ShippingQuery fromJson(Map<String, dynamic> json) {
    return ShippingQuery(
      id: json['id']!,
      from: User.fromJson(json['from']!),
      invoicePayload: json['invoice_payload']!,
      shippingAddress: ShippingAddress.fromJson(json['shipping_address']!),
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'id': id,
      'from': from,
      'invoice_payload': invoicePayload,
      'shipping_address': shippingAddress,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
