import 'dart:convert';

class MaskPosition {
  String point;
  double xShift;
  double yShift;
  double scale;

  MaskPosition({
    required this.point,
    required this.xShift,
    required this.yShift,
    required this.scale,
  });

  static MaskPosition fromJson(Map<String, dynamic> json) {
    return MaskPosition(
      point: json['point']!,
      xShift: json['x_shift']!,
      yShift: json['y_shift']!,
      scale: json['scale']!,
    );
  }

  static List<MaskPosition> listFromJsonArray(List<dynamic> json) {
    return List.generate(
      json.length,
      (i) => MaskPosition.fromJson(json[i]),
    );
  }

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
