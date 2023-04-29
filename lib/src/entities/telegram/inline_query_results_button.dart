import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// This object represents a button to be shown above inline query results.
/// You must use exactly one of the optional fields.
class InlineQueryResultsButton {
  /// Label text on the button
  String text;

  /// Optional.
  /// Description of the Web App that will be launched when the user presses
  /// the button.
  /// The Web App will be able to switch back to the inline mode using the
  /// method switchInlineQuery inside the Web App.
  WebAppInfo? webApp;

  /// Optional.
  /// Deep-linking parameter for the /start message sent to the bot when a
  /// user presses the button. 1-64 characters, only A-Z, a-z, 0-9, _ and - are
  /// allowed.
  String? startParameter;

  /// Basic constructor
  InlineQueryResultsButton({
    required this.text,
    this.webApp,
    this.startParameter,
  });

  /// Creates a object from a json
  static InlineQueryResultsButton fromJson(Map<String, dynamic> json) {
    return InlineQueryResultsButton(
      text: json['text']!,
      webApp: callIfNotNull(WebAppInfo.fromJson, json['web_app']),
      startParameter: json['start_parameter'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'text': text,
      'web_app': webApp,
      'start_parameter': startParameter,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
