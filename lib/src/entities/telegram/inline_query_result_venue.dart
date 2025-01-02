import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents a venue.
///
/// By default, the venue will be sent by the user.
///
/// Alternatively, you can use [inputMessageContent] to send a message with the
/// specified content instead of the venue.
class InlineQueryResultVenue extends InlineQueryResult {
  /// Type of the result, must be *venue*
  @override
  String type = 'venue';

  /// Unique identifier for this result, 1-64 Bytes
  @override
  String id;

  /// Latitude of the venue location in degrees
  double latitude;

  /// Longitude of the venue location in degrees
  double longitude;

  /// Title of the venue
  String title;

  /// Address of the venue
  String address;

  /// Foursquare identifier of the venue if known
  String? foursquareId;

  /// Foursquare type of the venue, if known.
  ///
  /// (For example, “arts_entertainment/default”, “arts_entertainment/aquarium”
  /// or “food/icecream”.)
  String? foursquareType;

  /// Google Places identifier of the venue
  String? googlePlaceId;

  /// Google Places type of the venue.
  ///
  /// See [supported types](https://developers.google.com/places/web-service/supported_types).
  String? googlePlaceType;

  /// [Inline keyboard](https://core.telegram.org/bots/features#inline-keyboards)
  /// attached to the message
  InlineKeyboardMarkup? replyMarkup;

  /// Content of the message to be sent instead of the venue
  InputMessageContent? inputMessageContent;

  /// Url of the thumbnail for the result
  String? thumbnailUrl;

  /// Thumbnail width
  int? thumbnailWidth;

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
  Map<String, dynamic> toJson() {
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
