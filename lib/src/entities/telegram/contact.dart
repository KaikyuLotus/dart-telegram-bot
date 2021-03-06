import 'dart:convert';

class Contact {
  String phoneNumber;
  String firstName;
  String? lastName;
  int? userId;
  String? vcard;

  Contact({
    required this.phoneNumber,
    required this.firstName,
    this.lastName,
    this.userId,
    this.vcard,
  });

  static Contact fromJson(Map<String, dynamic> json) {
    return Contact(
      phoneNumber: json['phone_number']!,
      firstName: json['first_name']!,
      lastName: json['last_name'],
      userId: json['user_id'],
      vcard: json['vcard'],
    );
  }

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
