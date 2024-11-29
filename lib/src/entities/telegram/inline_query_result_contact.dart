import 'dart:convert';

import '../../../telegram_entities.dart';

/// Represents a contact with a phone number.
///
/// By default, this contact will be sent by the user.
///
/// Alternatively, you can use [inputMessageContent] to send a message with the
/// specified content instead of the contact.
class InlineQueryResultContact extends InlineQueryResult {
  /// Type of the result, must be *contact*
  @override
  String type = 'contact';

  /// Unique identifier for this result, 1-64 Bytes
  @override
  String id;

  /// Contact's phone number
  String phoneNumber;

  /// Contact's first name
  String firstName;

  /// Contact's last name
  String? lastName;

  /// Additional data about the contact in the form of a [vCard](https://en.wikipedia.org/wiki/VCard),
  /// 0-2048 bytes
  String? vcard;

  /// [Inline keyboard](https://core.telegram.org/bots/features#inline-keyboards)
  /// attached to the message
  InlineKeyboardMarkup? replyMarkup;

  /// Content of the message to be sent instead of the contact
  InputMessageContent? inputMessageContent;

  /// Url of the thumbnail for the result
  String? thumbnailUrl;

  /// Thumbnail width
  int? thumbnailWidth;

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
  Map<String, dynamic> toJson() {
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
