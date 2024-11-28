import 'dart:convert';

import '../../../telegram_entities.dart';

/// The background is automatically filled based on the selected colors.
class BackgroundTypeFill extends BackgroundType {
  /// Type of the background, always “fill”
  @override
  String type = 'fill';

  /// The background fill
  BackgroundFill fill;

  /// Dimming of the background in dark themes, as a percentage; 0-100
  int darkThemeDimming;

  /// Basic constructor
  BackgroundTypeFill({
    required this.fill,
    required this.darkThemeDimming,
  });

  /// Creates an object from a json
  factory BackgroundTypeFill.fromJson(Map<String, dynamic> json) {
    return BackgroundTypeFill(
      fill: BackgroundFill.fromJson(json['fill']),
      darkThemeDimming: json['dark_theme_dimming'],
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'fill': fill,
      'dark_theme_dimming': darkThemeDimming,
    };
  }

  @override
  String toString() => json.encode(this);
}
