import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents a link to an article or web page.
class InlineQueryResultArticle extends InlineQueryResult {
  /// Type of the result, must be article
  String type = 'article';

  /// Unique identifier for this result, 1-64 Bytes
  String id;

  /// Title of the result
  String title;

  /// Content of the message to be sent
  InputMessageContent inputMessageContent;

  /// Optional.
  /// Inline keyboard attached to the message
  InlineKeyboardMarkup? replyMarkup;

  /// Optional.
  /// URL of the result
  String? url;

  /// Optional.
  /// Pass True if you don't want the URL to be shown in the message
  bool? hideUrl;

  /// Optional.
  /// Short description of the result
  String? description;

  /// Optional.
  /// Url of the thumbnail for the result
  String? thumbnailUrl;

  /// Optional.
  /// Thumbnail width
  int? thumbnailWidth;

  /// Optional.
  /// Thumbnail height
  int? thumbnailHeight;

  /// Basic constructor
  InlineQueryResultArticle({
    required this.id,
    required this.title,
    required this.inputMessageContent,
    this.replyMarkup,
    this.url,
    this.hideUrl,
    this.description,
    this.thumbnailUrl,
    this.thumbnailWidth,
    this.thumbnailHeight,
  });

  /// Creates a json from the object
  Map toJson() {
    return {
      'type': type,
      'id': id,
      'title': title,
      'input_message_content': inputMessageContent,
      'reply_markup': replyMarkup,
      'url': url,
      'hide_url': hideUrl,
      'description': description,
      'thumbnail_url': thumbnailUrl,
      'thumbnail_width': thumbnailWidth,
      'thumbnail_height': thumbnailHeight,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
