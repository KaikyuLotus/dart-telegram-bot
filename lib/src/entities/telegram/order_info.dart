import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// This object represents information about an order.
class OrderInfo {
  /// Optional.
  /// User name
  String? name;

  /// Optional.
  /// User's phone number
  String? phoneNumber;

  /// Optional.
  /// User email
  String? email;

  /// Optional.
  /// User shipping address
  ShippingAddress? shippingAddress;

  /// Basic constructor
  OrderInfo({
    this.name,
    this.phoneNumber,
    this.email,
    this.shippingAddress,
  });

  /// Creates a object from a json
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

  /// Creates a json from the object
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
