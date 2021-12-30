import 'dart:convert';

import '../../../telegram_entities.dart';

class InputVenueMessageContent extends InputMessageContent {
  double latitude;
  double longitude;
  String title;
  String address;
  String? foursquareId;
  String? foursquareType;
  String? googlePlaceId;
  String? googlePlaceType;

  InputVenueMessageContent(
    this.latitude,
    this.longitude,
    this.title,
    this.address, {
    this.foursquareId,
    this.foursquareType,
    this.googlePlaceId,
    this.googlePlaceType,
  });

  static InputVenueMessageContent fromJson(Map<String, dynamic> json) {
    return InputVenueMessageContent(
      json['latitude']!,
      json['longitude']!,
      json['title']!,
      json['address']!,
      foursquareId: json['foursquare_id'],
      foursquareType: json['foursquare_type'],
      googlePlaceId: json['google_place_id'],
      googlePlaceType: json['google_place_type'],
    );
  }

  Map toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'title': title,
      'address': address,
      'foursquare_id': foursquareId,
      'foursquare_type': foursquareType,
      'google_place_id': googlePlaceId,
      'google_place_type': googlePlaceType,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
