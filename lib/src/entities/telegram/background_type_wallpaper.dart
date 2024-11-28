import 'dart:convert';

import '../../../telegram_entities.dart';

/// The background is a wallpaper in the JPEG format.
class BackgroundTypeWallpaper extends BackgroundType {
  /// Type of the background, always “wallpaper”
  @override
  String type = 'wallpaper';

  /// Document with the wallpaper
  Document document;

  /// Dimming of the background in dark themes, as a percentage; 0-100
  int darkThemeDimming;

  /// True, if the wallpaper is downscaled to fit in a 450x450 square and
  /// then box-blurred with radius 12
  bool? isBlurred;

  /// True, if the background moves slightly when the device is tilted
  bool? isMoving;

  /// Basic constructor
  BackgroundTypeWallpaper({
    required this.document,
    required this.darkThemeDimming,
    this.isBlurred,
    this.isMoving,
  });

  /// Creates an object from a json
  factory BackgroundTypeWallpaper.fromJson(Map<String, dynamic> json) {
    return BackgroundTypeWallpaper(
      document: Document.fromJson(json['document']),
      darkThemeDimming: json['dark_theme_dimming'],
      isBlurred: json['is_blurred'],
      isMoving: json['is_moving'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'type': type,
      'document': document,
      'dark_theme_dimming': darkThemeDimming,
      'is_blurred': isBlurred,
      'is_moving': isMoving,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
