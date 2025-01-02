import 'dart:convert';

import '../../../telegram_entities.dart';

/// Describes reply parameters for the message that is being sent.
class ReplyParameters {
  /// Identifier of the message that will be replied to in the current chat,
  /// or in the chat chat_id if it is specified
  int messageId;

  /// Optional.
  /// If the message to be replied to is from a different chat, unique
  /// identifier for the chat or username of the channel
  /// (in the format @channelusername).
  /// Not supported for messages sent on behalf of a business account.
  ChatID? chatId;

  /// Optional.
  /// Pass True if the message should be sent even if the specified message to
  /// be replied to is not found.
  /// Always False for replies in another chat or forum topic.
  /// Always True for messages sent on behalf of a business account.
  bool? allowSendingWithoutReply;

  /// Optional.
  /// Quoted part of the message to be replied to;
  /// 0-1024 characters after entities parsing.
  /// The quote must be an exact substring of the message to be replied to,
  /// including bold, italic, underline, strikethrough, spoiler,
  /// and custom_emoji entities.
  /// The message will fail to send if the quote isn't found in the
  /// original message.
  String? quote;

  /// Optional.
  /// Mode for parsing entities in the quote.
  /// See formatting options for more details.
  ParseMode? quoteParseMode;

  /// Optional.
  /// A JSON-serialized list of special entities that appear in the quote.
  /// It can be specified instead of quote_parse_mode.
  List<MessageEntity>? quoteEntities;

  /// Optional.
  /// Position of the quote in the original message in UTF-16 code units
  int? quotePosition;

  /// Basic constructor
  ReplyParameters(
    this.messageId, {
    this.chatId,
    this.allowSendingWithoutReply,
    this.quote,
    this.quoteParseMode,
    this.quoteEntities,
    this.quotePosition,
  });

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'message_id': messageId,
      'chat_id': chatId,
      'allow_sending_without_reply': allowSendingWithoutReply,
      'quote': quote,
      'quote_parse_mode': quoteParseMode,
      'quote_entities': quoteEntities,
      'quote_position': quotePosition,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
