import 'package:dart_telegram_bot/telegram_entities.dart';

class Venue {
  Location location;
  String title;
  String address;
  String? foursquareId;
  String? foursquareType;
  String? googlePlaceId;
  String? googlePlaceType;

  Venue({
    required this.location,
    required this.title,
    required this.address,
    this.foursquareId,
    this.foursquareType,
    this.googlePlaceId,
    this.googlePlaceType,
  });

  static Venue fromJson(Map<String, dynamic> json) {
    return Venue(
      location: Location.fromJson(json['location']!),
      title: json['title']!,
      address: json['address']!,
      foursquareId: json['foursquare_id'],
      foursquareType: json['foursquare_type'],
      googlePlaceId: json['google_place_id'],
      googlePlaceType: json['google_place_type'],
    );
  }
}
