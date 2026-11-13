import 'dart:convert';

/// This object describes the background of a gift.
class GiftBackground {
  /// Center color of the background in RGB format
  int centerColor;

  /// Edge color of the background in RGB format
  int edgeColor;

  /// Text color of the background in RGB format
  int textColor;

  /// Basic constructor
  GiftBackground({
    required this.centerColor,
    required this.edgeColor,
    required this.textColor,
  });

  /// Creates an object from a json
  factory GiftBackground.fromJson(Map<String, dynamic> json) {
    return GiftBackground(
      centerColor: json['center_color'],
      edgeColor: json['edge_color'],
      textColor: json['text_color'],
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'center_color': centerColor,
      'edge_color': edgeColor,
      'text_color': textColor,
    };
  }

  @override
  String toString() => json.encode(this);
}
