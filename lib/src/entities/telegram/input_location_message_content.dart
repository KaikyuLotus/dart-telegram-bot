import 'dart:convert';

import '../../../telegram_entities.dart';

class InputLocationMessageContent extends InputMessageContent {
  double latitude;
  double longitude;
  double? horizontalAccuracy;
  int? livePeriod;
  int? heading;
  int? proximityAlertRadius;

  InputLocationMessageContent(
    this.latitude,
    this.longitude, {
    this.horizontalAccuracy,
    this.livePeriod,
    this.heading,
    this.proximityAlertRadius,
  });

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
