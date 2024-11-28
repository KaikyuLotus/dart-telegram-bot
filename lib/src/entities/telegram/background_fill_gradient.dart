import 'dart:convert';

import '../../../telegram_entities.dart';

/// The background is a gradient fill.
class BackgroundFillGradient extends BackgroundFill {
  /// Type of the background fill, always “gradient”
  @override
  String type = 'gradient';

  /// Top color of the gradient in the RGB24 format
  int topColor;

  /// Bottom color of the gradient in the RGB24 format
  int bottomColor;

  /// Clockwise rotation angle of the background fill in degrees; 0-359
  int rotationAngle;

  /// Basic constructor
  BackgroundFillGradient({
    required this.topColor,
    required this.bottomColor,
    required this.rotationAngle,
  });

  /// Creates an object from a json
  factory BackgroundFillGradient.fromJson(Map<String, dynamic> json) {
    return BackgroundFillGradient(
      topColor: json['top_color'],
      bottomColor: json['bottom_color'],
      rotationAngle: json['rotation_angle'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'type': type,
      'top_color': topColor,
      'bottom_color': bottomColor,
      'rotation_angle': rotationAngle,
    };
  }

  @override
  String toString() => json.encode(this);
}
