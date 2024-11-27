import 'dart:convert';

import '../../../telegram_entities.dart';

/// Describes the opening hours of a business.
class BusinessOpeningHours {
  /// Unique name of the time zone for which the opening hours are defined
  String timeZoneName;

  /// List of time intervals describing business opening hours
  List<BusinessOpeningHoursInterval> openingHours;

  /// Basic constructor
  BusinessOpeningHours({
    required this.timeZoneName,
    required this.openingHours,
  });

  /// Creates a object from a json
  factory BusinessOpeningHours.fromJson(Map<String, dynamic> json) {
    return BusinessOpeningHours(
      timeZoneName: json['time_zone_name'],
      openingHours: BusinessOpeningHoursInterval.listFromJsonArray(
        json['opening_hours'],
      ),
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'time_zone_name': timeZoneName,
      'opening_hours': openingHours,
    };
  }

  @override
  String toString() => json.encode(this);
}
