import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

class SuccessfulPayment {
  String currency;
  int totalAmount;
  String invoicePayload;
  String? shippingOptionId;
  OrderInfo? orderInfo;
  String telegramPaymentChargeId;
  String providerPaymentChargeId;

  SuccessfulPayment({
    required this.currency,
    required this.totalAmount,
    required this.invoicePayload,
    this.shippingOptionId,
    this.orderInfo,
    required this.telegramPaymentChargeId,
    required this.providerPaymentChargeId,
  });

  static SuccessfulPayment fromJson(Map<String, dynamic> json) {
    return SuccessfulPayment(
      currency: json['currency']!,
      totalAmount: json['total_amount']!,
      invoicePayload: json['invoice_payload']!,
      shippingOptionId: json['shipping_option_id'],
      orderInfo: callIfNotNull(OrderInfo.fromJson, json['order_info']),
      telegramPaymentChargeId: json['telegram_payment_charge_id']!,
      providerPaymentChargeId: json['provider_payment_charge_id']!,
    );
  }

  Map toJson() {
    return {
      'currency': currency,
      'total_amount': totalAmount,
      'invoice_payload': invoicePayload,
      'shipping_option_id': shippingOptionId,
      'order_info': orderInfo,
      'telegram_payment_charge_id': telegramPaymentChargeId,
      'provider_payment_charge_id': providerPaymentChargeId,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
