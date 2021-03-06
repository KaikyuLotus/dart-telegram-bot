import 'dart:convert';

class Location {
  double longitude;
  double latitude;
  double? horizontalAccuracy;
  int? livePeriod;
  int? heading;
  int? proximityAlertRadius;

  Location({
    required this.longitude,
    required this.latitude,
    this.horizontalAccuracy,
    this.livePeriod,
    this.heading,
    this.proximityAlertRadius,
  });

  static Location fromJson(Map<String, dynamic> json) {
    return Location(
      longitude: json['longitude']!,
      latitude: json['latitude']!,
      horizontalAccuracy: json['horizontal_accuracy'],
      livePeriod: json['live_period'],
      heading: json['heading'],
      proximityAlertRadius: json['proximity_alert_radius'],
    );
  }

  Map toJson() {
    return {
      'longitude': longitude,
      'latitude': latitude,
      'horizontal_accuracy': horizontalAccuracy,
      'live_period': livePeriod,
      'heading': heading,
      'proximity_alert_radius': proximityAlertRadius,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
