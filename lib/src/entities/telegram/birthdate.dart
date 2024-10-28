import 'dart:convert';

/// Describes the birthdate of a user.
class Birthdate {
  /// Day of the user's birth; 1-31
  int day;

  /// Month of the user's birth; 1-12
  int month;

  /// Optional.
  /// Year of the user's birth
  int? year;

  /// Basic constructor
  Birthdate({
    required this.day,
    required this.month,
    this.year,
  });

  /// Creates a object from a json
  factory Birthdate.fromJson(Map<String, dynamic> json) {
    return Birthdate(
      day: json['day'],
      month: json['month'],
      year: json['year'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'day': day,
      'month': month,
      'year': year,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
