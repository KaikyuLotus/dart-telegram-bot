import 'dart:convert';

/// Describes an interval of time during which a business is open.
class BusinessOpeningHoursInterval {
  /// The minute's sequence number in a week, starting on Monday,
  /// marking the start of the time interval during which the business is open;
  /// 0 - 7 * 24 * 60
  int openingMinute;

  /// The minute's sequence number in a week, starting on Monday,
  /// marking the end of the time interval during which the business is open;
  /// 0 - 8 * 24 * 60
  int closingMinute;

  /// Basic constructor
  BusinessOpeningHoursInterval({
    required this.openingMinute,
    required this.closingMinute,
  });

  /// Creates an object from a json
  factory BusinessOpeningHoursInterval.fromJson(Map<String, dynamic> json) {
    return BusinessOpeningHoursInterval(
      openingMinute: json['opening_minute'],
      closingMinute: json['closing_minute'],
    );
  }

  /// Creates a list of objects from a json array
  static List<BusinessOpeningHoursInterval> listFromJsonArray(
    List<dynamic> array,
  ) {
    return List.generate(
      array.length,
      (i) => BusinessOpeningHoursInterval.fromJson(array[i]),
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'opening_minute': openingMinute,
      'closing_minute': closingMinute,
    };
  }

  @override
  String toString() => json.encode(this);
}
