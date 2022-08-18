import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents the content of a contact message to be sent as the result of an inline query.
class InputContactMessageContent extends InputMessageContent {
  /// Contact's phone number
  String phoneNumber;

  /// Contact's first name
  String firstName;

  /// Optional.
  /// Contact's last name
  String? lastName;

  /// Optional.
  /// Additional data about the contact in the form of a vCard, 0-2048 bytes
  String? vcard;

  /// Basic constructor
  InputContactMessageContent(
    this.phoneNumber,
    this.firstName, {
    this.lastName,
    this.vcard,
  });

  /// Creates a object from a json
  static InputContactMessageContent fromJson(Map<String, dynamic> json) {
    return InputContactMessageContent(
      json['phone_number']!,
      json['first_name']!,
      lastName: json['last_name'],
      vcard: json['vcard'],
    );
  }

  /// Creates a json from the object
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
