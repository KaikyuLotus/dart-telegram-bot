import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents the content of a location message to be sent as the result of an
/// inline query.
class InputLocationMessageContent extends InputMessageContent {
  /// Latitude of the location in degrees
  double latitude;

  /// Longitude of the location in degrees
  double longitude;

  /// Optional.
  /// The radius of uncertainty for the location, measured in meters; 0-1500
  double? horizontalAccuracy;

  /// Optional.
  /// Period in seconds for which the location can be updated,
  /// should be between 60 and 86400.
  int? livePeriod;

  /// Optional.
  /// For live locations, a direction in which the user is moving, in degrees.
  /// Must be between 1 and 360 if specified.
  int? heading;

  /// Optional.
  /// For live locations, a maximum distance for proximity alerts about
  /// approaching another chat member, in meters. Must be between 1 and 100000
  /// if specified.
  int? proximityAlertRadius;

  /// Basic constructor
  InputLocationMessageContent(
    this.latitude,
    this.longitude, {
    this.horizontalAccuracy,
    this.livePeriod,
    this.heading,
    this.proximityAlertRadius,
  });

  /// Creates a object from a json
  static InputLocationMessageContent fromJson(Map<String, dynamic> json) {
    return InputLocationMessageContent(
      json['latitude']!,
      json['longitude']!,
      horizontalAccuracy: json['horizontal_accuracy'],
      livePeriod: json['live_period'],
      heading: json['heading'],
      proximityAlertRadius: json['proximity_alert_radius'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'horizontal_accuracy': horizontalAccuracy,
      'live_period': livePeriod,
      'heading': heading,
      'proximity_alert_radius': proximityAlertRadius,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
