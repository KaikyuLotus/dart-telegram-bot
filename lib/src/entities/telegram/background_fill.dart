import '../../../telegram_entities.dart';

/// This object describes the way a background is filled based on the
/// selected colors.
/// Currently, it can be one of
/// It can be one of:
/// [BackgroundFillSolid],
/// [BackgroundFillGradient],
/// [BackgroundFillFreeformGradient]
abstract class BackgroundFill {
  abstract final String type;

  static BackgroundFill fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case 'solid':
        return BackgroundFillSolid.fromJson(json);
      case 'gradient':
        return BackgroundFillGradient.fromJson(json);
      case 'freeform_gradient':
        return BackgroundFillFreeformGradient.fromJson(json);
      default:
        throw Exception('BackgroundFill type not recognized');
    }
  }
}
