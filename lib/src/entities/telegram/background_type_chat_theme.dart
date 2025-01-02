import 'dart:convert';

import '../../../telegram_entities.dart';

/// The background is taken directly from a built-in chat theme.
class BackgroundTypeChatTheme extends BackgroundType {
  /// Type of the background, always “chat_theme”
  @override
  String type = 'chat_theme';

  /// Name of the chat theme, which is usually an emoji
  String themeName;

  /// Basic constructor
  BackgroundTypeChatTheme({
    required this.themeName,
  });

  /// Creates an object from a json
  factory BackgroundTypeChatTheme.fromJson(Map<String, dynamic> json) {
    return BackgroundTypeChatTheme(
      themeName: json['theme_name'],
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'theme_name': themeName,
    };
  }

  @override
  String toString() => json.encode(this);
}
