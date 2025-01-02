import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// Represents the content of a text message to be sent as the result of an
/// inline query.
class InputTextMessageContent extends InputMessageContent {
  /// Text of the message to be sent, 1-4096 characters
  String messageText;

  /// Mode for parsing entities in the message text.
  ///
  /// See [formatting options](https://core.telegram.org/bots/api#formatting-options)
  ParseMode? parseMode;

  /// List of special entities that appear in message text, which can be
  /// specified instead of [parseMode]
  List<MessageEntity>? entities;

  /// Link preview generation options for the message
  LinkPreviewOptions? linkPreviewOptions;

  /// Basic constructor
  InputTextMessageContent(
    this.messageText, {
    this.parseMode,
    this.entities,
    this.linkPreviewOptions,
  });

  /// Creates an object from a json
  factory InputTextMessageContent.fromJson(Map<String, dynamic> json) {
    return InputTextMessageContent(
      json['message_text'],
      parseMode: callIfNotNull(ParseMode.forValue, json['parse_mode']),
      entities: callIfNotNull(
        MessageEntity.listFromJsonArray,
        json['entities'],
      ),
      linkPreviewOptions: callIfNotNull(
        LinkPreviewOptions.fromJson,
        json['link_preview_options'],
      ),
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'message_text': messageText,
      'parse_mode': parseMode,
      'entities': entities,
      'link_preview_options': linkPreviewOptions,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
