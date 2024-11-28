import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// This object represents a change of a reaction on a message performed
/// by a user.
class MessageReactionUpdated {
  /// The chat containing the message the user reacted to
  Chat chat;

  /// Unique identifier of the message inside the chat
  int messageId;

  /// Optional.
  /// The user that changed the reaction, if the user isn't anonymous
  User? user;

  /// Optional.
  /// The chat on behalf of which the reaction was changed,
  /// if the user is anonymous
  Chat? actorChat;

  /// Date of the change in Unix time
  int date;

  /// Previous list of reaction types that were set by the user
  List<ReactionType> oldReaction;

  /// New list of reaction types that have been set by the user
  List<ReactionType> newReaction;

  /// Basic constructor
  MessageReactionUpdated({
    required this.chat,
    required this.messageId,
    this.user,
    this.actorChat,
    required this.date,
    required this.oldReaction,
    required this.newReaction,
  });

  /// Creates an object from a json
  factory MessageReactionUpdated.fromJson(Map<String, dynamic> json) {
    return MessageReactionUpdated(
      chat: Chat.fromJson(json['chat']),
      messageId: json['message_id'],
      user: callIfNotNull(User.fromJson, json['user']),
      actorChat: callIfNotNull(Chat.fromJson, json['actor_chat']),
      date: json['date'],
      oldReaction: ReactionType.listFromJsonArray(json['old_reaction']),
      newReaction: ReactionType.listFromJsonArray(json['new_reaction']),
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'chat': chat,
      'message_id': messageId,
      'user': user,
      'actor_chat': actorChat,
      'date': date,
      'old_reaction': oldReaction,
      'new_reaction': newReaction,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
