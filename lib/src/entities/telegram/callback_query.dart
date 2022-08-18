import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// This object represents an incoming callback query from a callback button in
/// an inline keyboard. If the button that originated the query was attached to
/// a message sent by the bot, the field message will be present.
/// If the button was attached to a message sent via the bot (in inline mode),
/// the field inline_message_id will be present.
/// Exactly one of the fields data or game_short_name will be present.
class CallbackQuery {
  /// Unique identifier for this query
  String id;

  /// Sender
  User from;

  /// Optional.
  /// Message with the callback button that originated the query.
  /// Note that message content and message date will not be available if the
  /// message is too old
  Message? message;

  /// Optional.
  /// Identifier of the message sent via the bot in inline mode,
  /// that originated the query.
  String? inlineMessageId;

  /// Global identifier, uniquely corresponding to the chat to which the message
  /// with the callback button was sent. Useful for high scores in games.
  String chatInstance;

  /// Optional.
  /// Data associated with the callback button.
  /// Be aware that the message originated the query can contain no callback
  /// buttons with this data.
  String? data;

  /// Optional.
  /// Short name of a Game to be returned, serves as the unique identifier
  /// for the game
  String? gameShortName;

  /// Basic constructor
  CallbackQuery({
    required this.id,
    required this.from,
    this.message,
    this.inlineMessageId,
    required this.chatInstance,
    this.data,
    this.gameShortName,
  });

  /// Creates a object from a json
  static CallbackQuery fromJson(Map<String, dynamic> json) {
    return CallbackQuery(
      id: json['id']!,
      from: User.fromJson(json['from']!),
      message: callIfNotNull(Message.fromJson, json['message']),
      inlineMessageId: json['inline_message_id'],
      chatInstance: json['chat_instance'],
      data: json['data'],
      gameShortName: json['game_short_name'],
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'id': id,
      'from': from,
      'message': message,
      'inline_message_id': inlineMessageId,
      'chat_instance': chatInstance,
      'data': data,
      'game_short_name': gameShortName,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
