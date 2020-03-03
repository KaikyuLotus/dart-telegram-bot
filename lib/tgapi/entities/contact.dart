class Contact {
  String phoneNumber;
  String firstName;
  String lastName;
  int userId;
  String vcard;

  Contact({this.phoneNumber, this.firstName, this.lastName, this.userId, this.vcard});

  factory Contact.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return Contact(
        phoneNumber: json['phone_number'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        userId: json['user_id'],
        vcard: json['vcard']);
  }
}
