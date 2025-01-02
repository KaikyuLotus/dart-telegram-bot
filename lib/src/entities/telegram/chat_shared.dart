import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// This object contains information about the chat whose identifier was shared
/// with the bot using a [KeyboardButtonRequestChat] button.
class ChatShared {
  /// Identifier of the request
  int requestId;

  /// Identifier of the shared chat.
  ///
  /// This number may have more than 32 significant bits and some programming
  /// languages may have difficulty/silent defects in interpreting it.
  ///
  /// But it has at most 52 significant bits, so a 64-bit integer or
  /// double-precision float type are safe for storing this identifier.
  ///
  /// The bot may not have access to the user and could be unable to use this
  /// identifier, unless the user is already known to the bot by some
  /// other means.
  int chatId;

  /// Title of the chat, if the title was requested by the bot.
  String? title;

  /// Username of the chat, if the username was requested by the bot and
  /// available.
  String? username;

  /// Available sizes of the chat photo, if the photo was requested by the bot
  List<PhotoSize>? photo;

  /// Basic constructor
  ChatShared({
    required this.requestId,
    required this.chatId,
    this.title,
    this.username,
    this.photo,
  });

  /// Creates an object from a json
  factory ChatShared.fromJson(Map<String, dynamic> json) {
    return ChatShared(
      requestId: json['request_id'],
      chatId: json['chat_id'],
      title: json['title'],
      username: json['username'],
      photo: callIfNotNull(PhotoSize.listFromJsonArray, json['photo']),
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'request_id': requestId,
      'chat_id': chatId,
      'title': title,
      'username': username,
      'photo': photo,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
