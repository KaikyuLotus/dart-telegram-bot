import 'dart:convert';

/// This object contains basic information about a refunded payment.
class RefundedPayment {
  /// Three-letter ISO 4217 [currency](https://core.telegram.org/bots/payments#supported-currencies)
  /// code, or “XTR” for payments in [Telegram Stars](https://t.me/BotNews/90).
  ///
  /// Currently, always “XTR”
  String currency;

  /// Total refunded price in the *smallest units* of the currency
  /// (integer, **not** float/double).
  ///
  /// For example, for a price of `US$ 1.45` pass `amount = 145`.
  ///
  /// See the `exp` parameter in
  /// [currencies.json](https://core.telegram.org/bots/payments/currencies.json),
  /// it shows the number of digits past the decimal point for each currency
  /// (2 for the majority of currencies).
  int totalAmount;

  /// Bot-specified invoice payload
  String invoicePayload;

  /// Telegram payment identifier
  String telegramPaymentChargeId;

  /// Provider payment identifier
  String? providerPaymentChargeId;

  /// Basic constructor
  RefundedPayment({
    required this.currency,
    required this.totalAmount,
    required this.invoicePayload,
    required this.telegramPaymentChargeId,
    this.providerPaymentChargeId,
  });

  /// Creates an object from a json
  factory RefundedPayment.fromJson(Map<String, dynamic> json) {
    return RefundedPayment(
      currency: json['currency'],
      totalAmount: json['total_amount'],
      invoicePayload: json['invoice_payload'],
      telegramPaymentChargeId: json['telegram_payment_charge_id'],
      providerPaymentChargeId: json['provider_payment_charge_id'],
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'currency': currency,
      'total_amount': totalAmount,
      'invoice_payload': invoicePayload,
      'telegram_payment_charge_id': telegramPaymentChargeId,
      'provider_payment_charge_id': providerPaymentChargeId,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
