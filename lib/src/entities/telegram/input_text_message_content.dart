import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// Represents the content of a text message to be sent as the result of an
/// inline query.
class InputTextMessageContent extends InputMessageContent {
  /// Text of the message to be sent, 1-4096 characters
  String messageText;

  /// Optional.
  /// Mode for parsing entities in the message text.
  ParseMode? parseMode;

  /// Optional.
  /// List of special entities that appear in message text, which can be
  /// specified instead of parse_mode
  List<MessageEntity>? entities;

  /// Optional.
  /// Disables link previews for links in the sent message
  bool? disableWebPagePreview;

  /// Basic constructor
  InputTextMessageContent(
    this.messageText, {
    this.parseMode,
    this.entities,
    this.disableWebPagePreview,
  });

  /// Creates a object from a json
  static InputTextMessageContent fromJson(Map<String, dynamic> json) {
    return InputTextMessageContent(
      json['message_text']!,
      parseMode: callIfNotNull(ParseMode.forValue, json['parse_mode']),
      entities: callIfNotNull(
        MessageEntity.listFromJsonArray,
        json['entities'],
      ),
      disableWebPagePreview: json['disable_web_page_preview'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'message_text': messageText,
      'parse_mode': parseMode,
      'entities': entities,
      'disable_web_page_preview': disableWebPagePreview,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
