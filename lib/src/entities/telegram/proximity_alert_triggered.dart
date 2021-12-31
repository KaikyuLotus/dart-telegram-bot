import 'dart:convert';

import '../../../telegram_entities.dart';

class ProximityAlertTriggered {
  User traveler;
  User watcher;
  int distance;

  ProximityAlertTriggered({
    required this.traveler,
    required this.watcher,
    required this.distance,
  });

  static ProximityAlertTriggered fromJson(Map<String, dynamic> json) {
    return ProximityAlertTriggered(
      traveler: User.fromJson(json['traveler']),
      watcher: User.fromJson(json['watcher']),
      distance: json['distance'],
    );
  }

  Map toJson() {
    return {
      'traveler': traveler,
      'watcher': watcher,
      'distance': distance,
    };
  }

  @override
  String toString() => json.encode(this);
}
