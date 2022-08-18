import 'dart:convert';

/// This object represents a phone contact.
class Contact {
  /// Contact's phone number
  String phoneNumber;

  /// Contact's first name
  String firstName;

  /// Optional.
  /// Contact's last name
  String? lastName;

  /// Optional.
  /// Contact's user identifier in Telegram.
  /// This number may have more than 32 significant bits and some programming
  /// languages may have difficulty/silent defects in interpreting it.
  /// But it has at most 52 significant bits, so a 64-bit integer or
  /// double-precision float type are safe for storing this identifier.
  int? userId;

  /// Optional.
  /// Additional data about the contact in the form of a vCard
  String? vcard;

  /// Basic constructor
  Contact({
    required this.phoneNumber,
    required this.firstName,
    this.lastName,
    this.userId,
    this.vcard,
  });

  /// Creates a object from a json
  static Contact fromJson(Map<String, dynamic> json) {
    return Contact(
      phoneNumber: json['phone_number']!,
      firstName: json['first_name']!,
      lastName: json['last_name'],
      userId: json['user_id'],
      vcard: json['vcard'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'phone_number': phoneNumber,
      'first_name': firstName,
      'last_name': lastName,
      'user_id': userId,
      'vcard': vcard,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
