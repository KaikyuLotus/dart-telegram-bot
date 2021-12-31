import 'dart:convert';

import '../../../telegram_entities.dart';

class InlineQueryResultVenue extends InlineQueryResult {
  String type = 'venue';
  String id;
  double latitude;
  double longitude;
  String title;
  String address;
  String? foursquareId;
  String? foursquareType;
  String? googlePlaceId;
  String? googlePlaceType;
  InlineKeyboardMarkup? replyMarkup;
  InputMessageContent? inputMessageContent;
  String? thumbUrl;
  int? thumbWidth;
  int? thumbHeight;

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
    this.thumbUrl,
    this.thumbWidth,
    this.thumbHeight,
  });

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
      'thumb_url': thumbUrl,
      'thumb_width': thumbWidth,
      'thumb_height': thumbHeight,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}