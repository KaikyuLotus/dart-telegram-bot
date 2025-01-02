import '../../../telegram_entities.dart';

/// This object describes the type of a background.
///
/// Currently, it can be one of
/// [BackgroundTypeFill],
/// [BackgroundTypeWallpaper],
/// [BackgroundTypePattern],
/// [BackgroundTypeChatTheme]
abstract class BackgroundType {
  abstract final String type;

  static BackgroundType fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case 'fill':
        return BackgroundTypeFill.fromJson(json);
      case 'wallpaper':
        return BackgroundTypeWallpaper.fromJson(json);
      case 'pattern':
        return BackgroundTypePattern.fromJson(json);
      case 'chat_theme':
        return BackgroundTypeChatTheme.fromJson(json);
      default:
        throw Exception('BackgroundType type not recognized');
    }
  }
}
