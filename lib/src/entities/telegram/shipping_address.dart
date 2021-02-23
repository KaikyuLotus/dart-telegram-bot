class ShippingAddress {
  String countryCode;
  String state;
  String city;
  String streetLine1;
  String streetLine2;
  String postCode;

  ShippingAddress({this.countryCode, this.state, this.city, this.streetLine1, this.streetLine2, this.postCode});

  factory ShippingAddress.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return ShippingAddress(
      countryCode: json['country_code'],
      state: json['state'],
      city: json['city'],
      streetLine1: json['street_line1'],
      streetLine2: json['street_line2'],
      postCode: json['post_code'],
    );
  }
}
