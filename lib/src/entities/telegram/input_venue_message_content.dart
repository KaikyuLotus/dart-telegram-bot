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

  /// Optional.
  /// Foursquare identifier of the venue, if known
  String? foursquareId;

  /// Optional.
  /// Foursquare type of the venue, if known.
  /// (For example, “arts_entertainment/default”, “arts_entertainment/aquarium”
  /// or “food/icecream”.)
  String? foursquareType;

  /// Optional.
  /// Google Places identifier of the venue
  String? googlePlaceId;

  /// Optional.
  /// Google Places type of the venue.
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

  /// Creates a object from a json
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

  /// Creates a json from the object
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
