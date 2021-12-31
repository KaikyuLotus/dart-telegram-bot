import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

class OrderInfo {
  String? name;
  String? phoneNumber;
  String? email;
  ShippingAddress? shippingAddress;

  OrderInfo({
    this.name,
    this.phoneNumber,
    this.email,
    this.shippingAddress,
  });

  static OrderInfo fromJson(Map<String, dynamic> json) {
    return OrderInfo(
      name: json['name'],
      phoneNumber: json['phone_number'],
      email: json['email'],
      shippingAddress: callIfNotNull(
        ShippingAddress.fromJson,
        json['shipping_address'],
      ),
    );
  }

  Map toJson() {
    return {
      'name': name,
      'phone_number': phoneNumber,
      'email': email,
      'shipping_address': shippingAddress,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
