import 'dart:convert';

import '../../../telegram_entities.dart';

/// This object represents the content of a service message, sent whenever a
/// user in the chat triggers a proximity alert set by another user.
class ProximityAlertTriggered {
  /// User that triggered the alert
  User traveler;

  /// User that set the alert
  User watcher;

  /// The distance between the users
  int distance;

  /// Basic constructor
  ProximityAlertTriggered({
    required this.traveler,
    required this.watcher,
    required this.distance,
  });

  /// Creates a object from a json
  static ProximityAlertTriggered fromJson(Map<String, dynamic> json) {
    return ProximityAlertTriggered(
      traveler: User.fromJson(json['traveler']),
      watcher: User.fromJson(json['watcher']),
      distance: json['distance'],
    );
  }

  /// Creates a json from the object
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
