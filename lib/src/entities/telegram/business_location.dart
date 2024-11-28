import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// Contains information about the location of a Telegram Business account.
class BusinessLocation {
  /// Address of the business
  String address;

  /// Location of the business
  Location? location;

  /// Basic constructor
  BusinessLocation({
    required this.address,
    this.location,
  });

  /// Creates an object from a json
  factory BusinessLocation.fromJson(Map<String, dynamic> json) {
    return BusinessLocation(
      address: json['address'],
      location: callIfNotNull(Location.fromJson, json['location']),
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'address': address,
      'location': location,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
