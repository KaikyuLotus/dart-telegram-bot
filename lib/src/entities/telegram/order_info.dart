import 'dart:convert';

import 'package:dart_telegram_bot/telegram_entities.dart';

class OrderInfo {
  String name;
  String phoneNumber;
  String email;
  ShippingAddress shippingAddress;

  OrderInfo({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.shippingAddress,
  });

  static OrderInfo fromJson(Map<String, dynamic> json) {
    return OrderInfo(
      name: json['name']!,
      phoneNumber: json['phone_number']!,
      email: json['email']!,
      shippingAddress: json['shipping_address']!,
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
