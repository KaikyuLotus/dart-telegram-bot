import '../../../telegram_entities.dart';

/// Represents a menu button, which launches a Web App.
class MenuButtonWebApp extends MenuButton {
  /// Type of the button, must be web_app
  String type = "web_app";

  /// Text on the button
  String text;

  /// Description of the Web App that will be launched when the user presses the
  /// button. The Web App will be able to send an arbitrary message on behalf of
  /// the user using the method answerWebAppQuery.
  WebAppInfo webApp;

  /// Basic constructor
  MenuButtonWebApp(
    this.text,
    this.webApp,
  );

  /// Creates a object from a json
  static MenuButtonWebApp fromJson(Map<String, dynamic> json) {
    return MenuButtonWebApp(
      json['text'],
      json['web_app'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'type': type,
      'text': text,
      'web_app': webApp,
    };
  }
}
