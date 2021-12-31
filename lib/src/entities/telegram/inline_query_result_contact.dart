import 'dart:convert';

import '../../../telegram_entities.dart';

class InlineQueryResultContact extends InlineQueryResult {
  String type = 'contact';
  String id;
  String phoneNumber;
  String firstName;
  String? lastName;
  String? vcard;
  InlineKeyboardMarkup? replyMarkup;
  InputMessageContent? inputMessageContent;
  String? thumbUrl;
  int? thumbWidth;
  int? thumbHeight;

  InlineQueryResultContact({
    required this.id,
    required this.phoneNumber,
    required this.firstName,
    this.lastName,
    this.vcard,
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
      'phone_number': phoneNumber,
      'first_name': firstName,
      'last_name': lastName,
      'vcard': vcard,
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
