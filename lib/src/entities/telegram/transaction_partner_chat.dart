import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// Describes a transaction with a chat.
class TransactionPartnerChat extends TransactionPartner {
  /// Type of the transaction partner, always "chat"
  @override
  String type = 'chat';

  /// Information about the chat
  Chat chat;

  /// Optional.
  /// The gift sent to the chat by the bot
  Gift? gift;

  /// Basic constructor
  TransactionPartnerChat({
    required this.chat,
    this.gift,
  });

  /// Creates an object from a json
  factory TransactionPartnerChat.fromJson(Map<String, dynamic> json) {
    return TransactionPartnerChat(
      chat: Chat.fromJson(json['chat']),
      gift: callIfNotNull(Gift.fromJson, json['gift']),
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'chat': chat,
      'gift': gift,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
