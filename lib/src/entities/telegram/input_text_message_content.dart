import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

class InputTextMessageContent extends InputMessageContent {
  String messageText;
  ParseMode? parseMode;
  List<MessageEntity>? entities;
  bool? disableWebPagePreview;

  InputTextMessageContent(
    this.messageText, {
    this.parseMode,
    this.entities,
    this.disableWebPagePreview,
  });

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
