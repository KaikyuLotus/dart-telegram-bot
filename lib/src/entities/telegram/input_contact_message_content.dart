import 'dart:convert';

import '../../../telegram_entities.dart';

class InputContactMessageContent extends InputMessageContent {
  String phoneNumber;
  String firstName;
  String? lastName;
  String? vcard;

  InputContactMessageContent(
    this.phoneNumber,
    this.firstName, {
    this.lastName,
    this.vcard,
  });

  static InputContactMessageContent fromJson(Map<String, dynamic> json) {
    return InputContactMessageContent(
      json['phone_number']!,
      json['first_name']!,
      lastName: json['last_name'],
      vcard: json['vcard'],
    );
  }

  Map toJson() {
    return {
      'phone_number': phoneNumber,
      'first_name': firstName,
      'last_name': lastName,
      'vcard': vcard,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
