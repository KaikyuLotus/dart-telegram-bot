import '../../../telegram_entities.dart';

class MenuButtonWebApp extends MenuButton {
  String type = "web_app";
  String text;
  WebAppInfo webApp;

  MenuButtonWebApp(
    this.text,
    this.webApp,
  );

  static MenuButtonWebApp fromJson(Map<String, dynamic> json) {
    return MenuButtonWebApp(
      json['text'],
      json['web_app'],
    );
  }

  Map toJson() {
    return {
      'type': type,
      'text': text,
      'web_app': webApp,
    };
  }
}
