import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents a location on a map.
/// By default, the location will be sent by the user.
/// Alternatively, you can use input_message_content to send a message with the
/// specified content instead of the location.
class InlineQueryResultLocation extends InlineQueryResult {
  /// Type of the result, must be location
  String type = 'location';

  /// Unique identifier for this result, 1-64 Bytes
  String id;

  /// Location latitude in degrees
  double latitude;

  /// Location longitude in degrees
  double longitude;

  /// Location title
  String title;

  /// Optional.
  /// The radius of uncertainty for the location, measured in meters; 0-1500
  double? horizontalAccuracy;

  /// Optional.
  /// Period in seconds for which the location can be updated, should be between
  /// 60 and 86400.
  int? livePeriod;

  /// Optional.
  /// For live locations, a direction in which the user is moving, in degrees.
  /// Must be between 1 and 360 if specified.
  int? heading;

  /// Optional.
  /// For live locations, a maximum distance for proximity alerts about
  /// approaching another chat member, in meters.
  /// Must be between 1 and 100000 if specified.
  int? proximityAlertRadius;

  /// Optional.
  /// Inline keyboard attached to the message
  InlineKeyboardMarkup? replyMarkup;

  /// Optional.
  /// Content of the message to be sent instead of the location
  InputMessageContent? inputMessageContent;

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
  InlineQueryResultLocation({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.title,
    this.horizontalAccuracy,
    this.livePeriod,
    this.heading,
    this.proximityAlertRadius,
    this.replyMarkup,
    this.inputMessageContent,
    this.thumbnailUrl,
    this.thumbnailWidth,
    this.thumbnailHeight,
  });

  /// Creates a json from the object
  Map toJson() {
    return {
      'type': type,
      'id': id,
      'latitude': latitude,
      'longitude': longitude,
      'title': title,
      'horizontal_accuracy': horizontalAccuracy,
      'live_period': livePeriod,
      'heading': heading,
      'proximity_alert_radius': proximityAlertRadius,
      'reply_markup': replyMarkup,
      'input_message_content': inputMessageContent,
      'thumbnail_url': thumbnailUrl,
      'thumbnail_width': thumbnailWidth,
      'thumbnail_height': thumbnailHeight,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
