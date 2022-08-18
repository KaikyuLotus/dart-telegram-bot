import 'dart:convert';

/// This object describes the position on faces where a mask should be placed
/// by default.
class MaskPosition {
  /// The part of the face relative to which the mask should be placed.
  /// One of “forehead”, “eyes”, “mouth”, or “chin”.
  String point;

  /// Shift by X-axis measured in widths of the mask scaled to the face size,
  /// from left to right.
  /// For example, choosing -1.0 will place mask just to the left of the default
  /// mask position.
  double xShift;

  /// Shift by Y-axis measured in heights of the mask scaled to the face size,
  /// from top to bottom.
  /// For example, 1.0 will place the mask just below the default mask position.
  double yShift;

  /// Mask scaling coefficient. For example, 2.0 means double size.
  double scale;

  /// Basic constructor
  MaskPosition({
    required this.point,
    required this.xShift,
    required this.yShift,
    required this.scale,
  });

  /// Creates a object from a json
  static MaskPosition fromJson(Map<String, dynamic> json) {
    return MaskPosition(
      point: json['point']!,
      xShift: json['x_shift']!,
      yShift: json['y_shift']!,
      scale: json['scale']!,
    );
  }

  /// Creates a list of object from a json array
  static List<MaskPosition> listFromJsonArray(List<dynamic> json) {
    return List.generate(
      json.length,
      (i) => MaskPosition.fromJson(json[i]),
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'point': point,
      'x_shift': xShift,
      'y_shift': yShift,
      'scale': scale,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
