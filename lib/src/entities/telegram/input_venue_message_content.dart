import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents the content of a venue message to be sent as the result of an
/// inline query.
class InputVenueMessageContent extends InputMessageContent {
  /// Latitude of the venue in degrees
  double latitude;

  /// Longitude of the venue in degrees
  double longitude;

  /// Name of the venue
  String title;

  /// Address of the venue
  String address;

  /// Foursquare identifier of the venue, if known
  String? foursquareId;

  /// Foursquare type of the venue, if known.
  ///
  /// (For example, “arts_entertainment/default”, “arts_entertainment/aquarium”
  /// or “food/icecream”.)
  String? foursquareType;

  /// Google Places identifier of the venue
  String? googlePlaceId;

  /// Google Places type of the venue.
  ///
  /// See [supported types](https://developers.google.com/places/web-service/supported_types).
  String? googlePlaceType;

  /// Basic constructor
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

  /// Creates an object from a json
  factory InputVenueMessageContent.fromJson(Map<String, dynamic> json) {
    return InputVenueMessageContent(
      json['latitude'],
      json['longitude'],
      json['title'],
      json['address'],
      foursquareId: json['foursquare_id'],
      foursquareType: json['foursquare_type'],
      googlePlaceId: json['google_place_id'],
      googlePlaceType: json['google_place_type'],
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
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
