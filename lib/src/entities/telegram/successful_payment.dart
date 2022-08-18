import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// This object contains basic information about a successful payment.
class SuccessfulPayment {
  /// Three-letter ISO 4217 currency code
  String currency;

  /// Total price in the smallest units of the currency
  /// (integer, not float/double).
  /// For example, for a price of US$ 1.45 pass amount = 145.
  /// See the exp parameter in currencies.json, it shows the number of digits
  /// past the decimal point for each currency
  /// (2 for the majority of currencies).
  int totalAmount;

  /// Bot specified invoice payload
  String invoicePayload;

  /// Optional.
  /// Identifier of the shipping option chosen by the user
  String? shippingOptionId;

  /// Optional.
  /// Order information provided by the user
  OrderInfo? orderInfo;

  /// Telegram payment identifier
  String telegramPaymentChargeId;

  /// Provider payment identifier
  String providerPaymentChargeId;

  /// Basic constructor
  SuccessfulPayment({
    required this.currency,
    required this.totalAmount,
    required this.invoicePayload,
    this.shippingOptionId,
    this.orderInfo,
    required this.telegramPaymentChargeId,
    required this.providerPaymentChargeId,
  });

  /// Creates a object from a json
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

  /// Creates a json from the object
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
