import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents a contact with a phone number.
/// By default, this contact will be sent by the user.
/// Alternatively, you can use input_message_content to send a message with the
/// specified content instead of the contact.
class InlineQueryResultContact extends InlineQueryResult {
  /// Type of the result, must be contact
  String type = 'contact';

  /// Unique identifier for this result, 1-64 Bytes
  String id;

  /// Contact's phone number
  String phoneNumber;

  /// Contact's first name
  String firstName;

  /// Optional.
  /// Contact's last name
  String? lastName;

  /// Optional.
  /// Additional data about the contact in the form of a vCard, 0-2048 bytes
  String? vcard;

  /// Optional.
  /// Inline keyboard attached to the message
  InlineKeyboardMarkup? replyMarkup;

  /// Optional.
  /// Content of the message to be sent instead of the contact
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
  InlineQueryResultContact({
    required this.id,
    required this.phoneNumber,
    required this.firstName,
    this.lastName,
    this.vcard,
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
      'phone_number': phoneNumber,
      'first_name': firstName,
      'last_name': lastName,
      'vcard': vcard,
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
