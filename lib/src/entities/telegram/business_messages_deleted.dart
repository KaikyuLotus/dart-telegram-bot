import 'dart:convert';

import '../../../telegram_entities.dart';

/// This object is received when messages are deleted from a connected
/// business account.
class BusinessMessagesDeleted {
  /// Unique identifier of the business connection
  String businessConnectionId;

  /// Information about a chat in the business account.
  ///
  /// The bot may not have access to the chat or the corresponding user.
  Chat chat;

  /// The list of identifiers of deleted messages in the chat of the
  /// business account
  List<int> messageIds;

  /// Basic constructor
  BusinessMessagesDeleted({
    required this.businessConnectionId,
    required this.chat,
    required this.messageIds,
  });

  /// Creates a object from a json
  factory BusinessMessagesDeleted.fromJson(Map<String, dynamic> json) {
    return BusinessMessagesDeleted(
      businessConnectionId: json['business_connection_id'],
      chat: Chat.fromJson(json['chat']),
      messageIds: List.from(json['message_ids']),
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'business_connection_id': businessConnectionId,
      'chat': chat,
      'message_ids': messageIds,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
