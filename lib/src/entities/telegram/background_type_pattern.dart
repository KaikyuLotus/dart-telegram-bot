import 'dart:convert';

import '../../../telegram_entities.dart';

/// The background is a PNG or TGV
/// (gzipped subset of SVG with MIME type “application/x-tgwallpattern”)
/// pattern to be combined with the background fill chosen by the user.
class BackgroundTypePattern extends BackgroundType {
  /// Type of the background, always “pattern”
  @override
  String type = 'pattern';

  /// Document with the pattern
  Document document;

  /// The background fill that is combined with the pattern
  BackgroundFill fill;

  /// Intensity of the pattern when it is shown above the filled background;
  /// 0-100
  int intensity;

  /// True, if the background fill must be applied only to the pattern itself.
  /// All other pixels are black in this case. For dark themes only
  bool? isInverted;

  /// True, if the background moves slightly when the device is tilted
  bool? isMoving;

  /// Basic constructor
  BackgroundTypePattern({
    required this.document,
    required this.fill,
    required this.intensity,
    this.isInverted,
    this.isMoving,
  });

  /// Creates a object from a json
  factory BackgroundTypePattern.fromJson(Map<String, dynamic> json) {
    return BackgroundTypePattern(
      document: Document.fromJson(json['document']),
      fill: BackgroundFill.fromJson(json['fill']),
      intensity: json['intensity'],
      isInverted: json['is_inverted'],
      isMoving: json['is_moving'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'type': type,
      'document': document,
      'fill': fill,
      'intensity': intensity,
      'is_inverted': isInverted,
      'is_moving': isMoving,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
