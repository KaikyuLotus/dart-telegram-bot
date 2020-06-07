part of '../../entities.dart';

class SuccessfulPayment {
  String currency;
  int totalAmount;
  String invoicePayload;
  String shippingOptionId;
  OrderInfo orderInfo;
  String telegramPaymentChargeId;
  String providerPaymentChargeId;

  SuccessfulPayment(
      {this.currency,
      this.totalAmount,
      this.invoicePayload,
      this.shippingOptionId,
      this.orderInfo,
      this.telegramPaymentChargeId,
      this.providerPaymentChargeId});

  factory SuccessfulPayment.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return SuccessfulPayment(
      currency: json['currency'],
      totalAmount: json['total_amount'],
      invoicePayload: json['invoice_payload'],
      shippingOptionId: json['shipping_option_id'],
      orderInfo: json['order_info'],
      telegramPaymentChargeId: json['telegram_payment_charge_id'],
      providerPaymentChargeId: json['provider_payment_charge_id'],
    );
  }
}
