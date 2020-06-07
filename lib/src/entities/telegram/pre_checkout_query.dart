part of '../../entities.dart';

class PreCheckoutQuery {
  String id;
  User from;
  String currency;
  int totalAmount;
  String invoicePayload;
  String shippingOptionId;
  OrderInfo orderInfo;

  PreCheckoutQuery(
      {this.id,
      this.from,
      this.currency,
      this.totalAmount,
      this.invoicePayload,
      this.shippingOptionId,
      this.orderInfo});

  factory PreCheckoutQuery.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return PreCheckoutQuery(
      id: json['id'],
      from: json['from'],
      currency: json['currency'],
      totalAmount: json['total_amount'],
      invoicePayload: json['invoice_payload'],
      shippingOptionId: json['shipping_option_id'],
      orderInfo: json['order_info'],
    );
  }
}
