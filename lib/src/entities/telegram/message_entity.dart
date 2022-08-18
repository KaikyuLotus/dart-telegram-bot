import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// This object represents one special entity in a text message.
/// For example, hashtags, usernames, URLs, etc.
class MessageEntity {
  /// Type of the entity.
  /// Currently, can be “mention” (@username), “hashtag” (#hashtag),
  /// “cashtag” ($USD), “bot_command” (/start@jobs_bot),
  /// “url” (https://telegram.org), “email” (do-not-reply@telegram.org),
  /// “phone_number” (+1-212-555-0123), “bold” (bold text),
  /// “italic” (italic text), “underline” (underlined text),
  /// “strikethrough” (strikethrough text), “spoiler” (spoiler message),
  /// “code” (monowidth string), “pre” (monowidth block),
  /// “text_link” (for clickable text URLs),
  /// “text_mention” (for users without usernames),
  /// “custom_emoji” (for inline custom emoji stickers)
  String type;

  /// Offset in UTF-16 code units to the start of the entity
  int offset;

  /// Length of the entity in UTF-16 code units
  int length;

  /// Optional.
  /// For “text_link” only, URL that will be opened after user taps on the text
  String? url;

  /// Optional.
  /// For “text_mention” only, the mentioned user
  User? user;

  /// Optional.
  /// For “pre” only, the programming language of the entity text
  String? language;

  /// Optional.
  /// For “custom_emoji” only, unique identifier of the custom emoji.
  /// Use getCustomEmojiStickers to get full information about the sticker
  String? customEmojiId;

  /// Basic constructor
  MessageEntity({
    required this.type,
    required this.offset,
    required this.length,
    this.url,
    this.user,
    this.language,
    this.customEmojiId,
  });

  /// Creates a object from a json
  static MessageEntity fromJson(Map<String, dynamic> json) {
    return MessageEntity(
      type: json['type']!,
      offset: json['offset']!,
      length: json['length']!,
      url: json['url'],
      user: callIfNotNull(User.fromJson, json['user']),
      language: json['language'],
      customEmojiId: json['custom_emoji_id'],
    );
  }

  /// Creates a list of object from a json array
  static List<MessageEntity> listFromJsonArray(List<dynamic> json) {
    return List.generate(
      json.length,
      (i) => MessageEntity.fromJson(json[i]),
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'type': type,
      'offset': offset,
      'length': length,
      'url': url,
      'user': user,
      'language': language,
      'custom_emoji_id': customEmojiId,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
