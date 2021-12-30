import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

class PreCheckoutQuery {
  String id;
  User from;
  String currency;
  int totalAmount;
  String invoicePayload;
  String? shippingOptionId;
  OrderInfo? orderInfo;

  PreCheckoutQuery({
    required this.id,
    required this.from,
    required this.currency,
    required this.totalAmount,
    required this.invoicePayload,
    this.shippingOptionId,
    this.orderInfo,
  });

  static PreCheckoutQuery fromJson(Map<String, dynamic> json) {
    return PreCheckoutQuery(
      id: json['id']!,
      from: User.fromJson(json['from']!),
      currency: json['currency']!,
      totalAmount: json['total_amount']!,
      invoicePayload: json['invoice_payload']!,
      shippingOptionId: json['shipping_option_id'],
      orderInfo: callIfNotNull(OrderInfo.fromJson, json['order_info']),
    );
  }

  Map toJson() {
    return {
      'id': id,
      'from': from,
      'currency': currency,
      'total_amount': totalAmount,
      'invoice_payload': invoicePayload,
      'shipping_option_id': shippingOptionId,
      'order_info': orderInfo,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
