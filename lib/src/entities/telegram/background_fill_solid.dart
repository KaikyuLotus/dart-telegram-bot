import 'dart:convert';

import '../../../telegram_entities.dart';

/// The background is filled using the selected color.
class BackgroundFillSolid extends BackgroundFill {
  /// Type of the background fill, always “solid”
  @override
  String type = 'solid';

  /// The color of the background fill in the RGB24 format
  int color;

  /// Basic constructor
  BackgroundFillSolid({
    required this.color,
  });

  /// Creates an object from a json
  factory BackgroundFillSolid.fromJson(Map<String, dynamic> json) {
    return BackgroundFillSolid(
      color: json['color'],
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'color': color,
    };
  }

  @override
  String toString() => json.encode(this);
}
