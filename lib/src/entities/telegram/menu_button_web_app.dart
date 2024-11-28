import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents a menu button, which launches a [Web App](https://core.telegram.org/bots/webapps).
class MenuButtonWebApp extends MenuButton {
  /// Type of the button, must be web_app
  @override
  String type = 'web_app';

  /// Text on the button
  String text;

  /// Description of the Web App that will be launched when the user presses the
  /// button.
  ///
  /// The Web App will be able to send an arbitrary message on behalf of
  /// the user using the method answerWebAppQuery.
  ///
  /// Alternatively, a t.me link to a Web App of the bot can be specified in
  /// the object instead of the Web App's URL, in which case the Web App will be
  /// opened as if the user pressed the link.
  WebAppInfo webApp;

  /// Basic constructor
  MenuButtonWebApp({
    required this.text,
    required this.webApp,
  });

  /// Creates an object from a json
  factory MenuButtonWebApp.fromJson(Map<String, dynamic> json) {
    return MenuButtonWebApp(
      text: json['text'],
      webApp: WebAppInfo.fromJson(json['web_app']),
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'text': text,
      'web_app': webApp,
    };
  }

  @override
  String toString() => json.encode(this);
}
