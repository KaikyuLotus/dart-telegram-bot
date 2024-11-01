import 'dart:convert';

import '../../../telegram_entities.dart';

/// The background is a freeform gradient that rotates after every message in
/// the chat.
class BackgroundFillFreeformGradient extends BackgroundFill {
  /// Type of the background fill, always “freeform_gradient”
  @override
  String type = 'freeform_gradient';

  /// A list of the 3 or 4 base colors that are used to generate the
  /// freeform gradient in the RGB24 format
  List<int> colors;

  /// Basic constructor
  BackgroundFillFreeformGradient({
    required this.colors,
  });

  /// Creates a object from a json
  factory BackgroundFillFreeformGradient.fromJson(Map<String, dynamic> json) {
    return BackgroundFillFreeformGradient(
      colors: List.from(json['colors']),
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'type': type,
      'colors': colors,
    };
  }

  @override
  String toString() => json.encode(this);
}
