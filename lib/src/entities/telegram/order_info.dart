import 'package:dart_telegram_bot/telegram_entities.dart';

class OrderInfo {
  String name;
  String phoneNumber;
  String email;
  ShippingAddress shippingAddress;

  OrderInfo({this.name, this.phoneNumber, this.email, this.shippingAddress});

  factory OrderInfo.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return OrderInfo(
      name: json['name'],
      phoneNumber: json['phone_number'],
      email: json['email'],
      shippingAddress: json['shipping_address'],
    );
  }
}
