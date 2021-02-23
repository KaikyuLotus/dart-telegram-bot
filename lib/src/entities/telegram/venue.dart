import 'package:dart_telegram_bot/telegram_entities.dart';

class Venue {
  Location location;
  String title;
  String address;
  String foursquareId;
  String foursquareType;

  Venue({
    this.location,
    this.title,
    this.address,
    this.foursquareId,
    this.foursquareType,
  });

  factory Venue.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return Venue(
      location: Location.fromJson(json['location']),
      title: json['title'],
      address: json['address'],
      foursquareId: json['foursquare_id'],
      foursquareType: json['foursquare_type'],
    );
  }
}
