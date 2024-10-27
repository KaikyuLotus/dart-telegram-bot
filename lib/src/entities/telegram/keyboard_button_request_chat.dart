import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// This object defines the criteria used to request a suitable chat.
/// The identifier of the selected chat will be shared with the bot when
/// the corresponding button is pressed.
class KeyboardButtonRequestChat {
  /// Signed 32-bit identifier of the request, which will be received back in
  /// the ChatShared object.
  /// Must be unique within the message
  int requestId;

  /// Pass True to request a channel chat, pass False to request a group or
  /// a supergroup chat.
  bool chatIsChannel;

  /// Optional.
  /// Pass True to request a forum supergroup, pass False to request
  /// a non-forum chat.
  /// If not specified, no additional restrictions are applied.
  bool? chatIsForum;

  /// Optional.
  /// Pass True to request a supergroup or a channel with a username,
  /// pass False to request a chat without a username.
  /// If not specified, no additional restrictions are applied.
  bool? chatHasUsername;

  /// Optional.
  /// Pass True to request a chat owned by the user.
  /// Otherwise, no additional restrictions are applied.
  bool? chatIsCreated;

  /// Optional.
  /// A JSON-serialized object listing the required administrator rights of
  /// the user in the chat.
  /// The rights must be a superset of bot_administrator_rights.
  /// If not specified, no additional restrictions are applied.
  ChatAdministratorRights? userAdministratorRights;

  /// Optional.
  /// A JSON-serialized object listing the required administrator rights of
  /// the bot in the chat.
  /// The rights must be a subset of user_administrator_rights.
  /// If not specified, no additional restrictions are applied.
  ChatAdministratorRights? botAdministratorRights;

  /// Optional.
  /// Pass True to request a chat with the bot as a member.
  /// Otherwise, no additional restrictions are applied.
  bool? botIsMember;

  /// Optional.
  /// Pass True to request the chat's title
  bool? requestTitle;

  /// Optional.
  /// Pass True to request the chat's username
  bool? requestUsername;

  /// Optional.
  /// Pass True to request the chat's photo
  bool? requestPhoto;

  /// Basic constructor
  KeyboardButtonRequestChat(
    this.requestId, {
    required this.chatIsChannel,
    this.chatIsForum,
    this.chatHasUsername,
    this.chatIsCreated,
    this.userAdministratorRights,
    this.botAdministratorRights,
    this.botIsMember,
    this.requestTitle,
    this.requestUsername,
    this.requestPhoto,
  });

  /// Creates a object from a json
  factory KeyboardButtonRequestChat.fromJson(Map<String, dynamic> json) {
    return KeyboardButtonRequestChat(
      json['request_id'],
      chatIsChannel: json['chat_is_channel'],
      chatIsForum: json['chat_is_forum'],
      chatHasUsername: json['chat_has_username'],
      chatIsCreated: json['chat_is_created'],
      userAdministratorRights: callIfNotNull(
        ChatAdministratorRights.fromJson,
        json['user_administrator_rights'],
      ),
      botAdministratorRights: callIfNotNull(
        ChatAdministratorRights.fromJson,
        json['bot_administrator_rights'],
      ),
      botIsMember: json['bot_is_member'],
      requestTitle: json['request_title'],
      requestUsername: json['request_username'],
      requestPhoto: json['request_photo'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'request_id': requestId,
      'chat_is_channel': chatIsChannel,
      'chat_is_forum': chatIsForum,
      'chat_has_username': chatHasUsername,
      'chat_is_created': chatIsCreated,
      'user_administrator_rights': userAdministratorRights,
      'bot_administrator_rights': botAdministratorRights,
      'bot_is_member': botIsMember,
      'request_title': requestTitle,
      'request_username': requestUsername,
      'request_photo': requestPhoto,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
