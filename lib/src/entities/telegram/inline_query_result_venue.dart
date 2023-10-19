import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents a venue.
/// By default, the venue will be sent by the user.
/// Alternatively, you can use input_message_content to send a message with the
/// specified content instead of the venue.
class InlineQueryResultVenue extends InlineQueryResult {
  /// Type of the result, must be venue
  String type = 'venue';

  /// Unique identifier for this result, 1-64 Bytes
  String id;

  /// Latitude of the venue location in degrees
  double latitude;

  /// Longitude of the venue location in degrees
  double longitude;

  /// Title of the venue
  String title;

  /// Address of the venue
  String address;

  /// Optional.
  /// Foursquare identifier of the venue if known
  String? foursquareId;

  /// Optional.
  /// Foursquare type of the venue, if known.
  /// (For example, “arts_entertainment/default”, “arts_entertainment/aquarium”
  /// or “food/icecream”.)
  String? foursquareType;

  /// Optional.
  /// Google Places identifier of the venue
  String? googlePlaceId;

  /// Optional.
  /// Google Places type of the venue.
  String? googlePlaceType;

  /// Optional.
  /// Inline keyboard attached to the message
  InlineKeyboardMarkup? replyMarkup;

  /// Optional.
  /// Content of the message to be sent instead of the venue
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
  InlineQueryResultVenue({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.title,
    required this.address,
    this.foursquareId,
    this.foursquareType,
    this.googlePlaceId,
    this.googlePlaceType,
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
      'address': address,
      'foursquare_id': foursquareId,
      'foursquare_type': foursquareType,
      'google_place_id': googlePlaceId,
      'google_place_type': googlePlaceType,
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
