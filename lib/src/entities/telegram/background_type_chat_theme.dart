import 'dart:convert';

import '../../../telegram_entities.dart';

/// The background is taken directly from a built-in chat theme.
class BackgroundTypeChatTheme extends BackgroundType {
  /// Type of the background, always “chat_theme”
  @override
  String type = 'chat_theme';

  /// Name of the chat theme, which is usually an emoji
  String chatTheme;

  /// Basic constructor
  BackgroundTypeChatTheme({
    required this.chatTheme,
  });

  /// Creates a object from a json
  factory BackgroundTypeChatTheme.fromJson(Map<String, dynamic> json) {
    return BackgroundTypeChatTheme(
      chatTheme: json['chat_theme'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'type': type,
      'chat_theme': chatTheme,
    };
  }

  @override
  String toString() => json.encode(this);
}
