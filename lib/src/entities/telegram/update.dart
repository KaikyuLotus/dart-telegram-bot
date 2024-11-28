import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// This object represents an incoming update.
///
/// At most one of the optional parameters can be present in any given update.
class Update {
  /// The update's unique identifier.
  ///
  /// Update identifiers start from a certain positive number and increase
  /// sequentially.
  ///
  /// This identifier becomes especially handy if you're using [webhooks](https://core.telegram.org/bots/api#setwebhook),
  /// since it allows you to ignore repeated updates or to restore the correct
  /// update sequence, should they get out of order.
  ///
  /// If there are no new updates for at least a week, then identifier of the
  /// next update will be chosen randomly instead of sequentially.
  int updateId;

  /// New incoming message of any kind - text, photo, sticker, etc.
  Message? message;

  /// New version of a message that is known to the bot and was edited.
  ///
  /// This update may at times be triggered by changes to message fields that
  /// are either unavailable or not actively used by your bot.
  Message? editedMessage;

  /// New incoming channel post of any kind - text, photo, sticker, etc.
  Message? channelPost;

  /// New version of a channel post that is known to the bot and was edited.
  ///
  /// This update may at times be triggered by changes to message fields that
  /// are either unavailable or not actively used by your bot.
  Message? editedChannelPost;

  /// The bot was connected to or disconnected from a business account,
  /// or a user edited an existing connection with the bot
  BusinessConnection? businessConnection;

  /// New message from a connected business account
  Message? businessMessage;

  /// New version of a message from a connected business account
  Message? editedBusinessMessage;

  /// Messages were deleted from a connected business account
  BusinessMessagesDeleted? deletedBusinessMessages;

  /// A reaction to a message was changed by a user.
  ///
  /// The bot must be an administrator in the chat and must explicitly specify
  /// `"message_reaction"` in the list of *allowed_updates* to receive these
  /// updates.
  ///
  /// The update isn't received for reactions set by bots.
  MessageReactionUpdated? messageReaction;

  /// Reactions to a message with anonymous reactions were changed.
  ///
  /// The bot must be an administrator in the chat and must explicitly specify
  /// `"message_reaction_count"` in the list of *allowed_updates* to receive
  /// these updates.
  ///
  /// The updates are grouped and can be sent with delay up to a few minutes.
  MessageReactionCountUpdated? messageReactionCount;

  /// New incoming [inline](https://core.telegram.org/bots/api#inline-mode) query
  InlineQuery? inlineQuery;

  /// The result of an [inline](https://core.telegram.org/bots/api#inline-mode)
  /// query that was chosen by a user and sent to their chat partner.
  ///
  /// Please see our documentation on the [feedback collecting](https://core.telegram.org/bots/inline#collecting-feedback)
  /// for details on how to enable these updates for your bot.
  ChosenInlineResult? chosenInlineResult;

  /// New incoming callback query
  CallbackQuery? callbackQuery;

  /// New incoming shipping query.
  ///
  /// Only for invoices with flexible price
  ShippingQuery? shippingQuery;

  /// New incoming pre-checkout query.
  ///
  /// Contains full information about checkout
  PreCheckoutQuery? preCheckoutQuery;

  /// A user purchased paid media with a non-empty payload sent by the bot in a
  /// non-channel chat
  PaidMediaPurchased? purchasedPaidMedia;

  /// New poll state.
  ///
  /// Bots receive only updates about stopped polls and polls,
  /// which are sent by the bot
  Poll? poll;

  /// A user changed their answer in a non-anonymous poll.
  ///
  /// Bots receive new votes only in polls that were sent by the bot itself.
  PollAnswer? pollAnswer;

  /// The bot's chat member status was updated in a chat.
  ///
  /// For private chats, this update is received only when the bot is blocked
  /// or unblocked by the user.
  ChatMemberUpdated? myChatMember;

  /// A chat member's status was updated in a chat.
  ///
  /// The bot must be an administrator in the chat and must explicitly specify
  /// `“chat_member”` in the list of *allowed_updates* to receive these updates.
  ChatMemberUpdated? chatMember;

  /// A request to join the chat has been sent.
  ///
  /// The bot must have the *can_invite_users* administrator right in the chat
  /// to receive these updates.
  ChatJoinRequest? chatJoinRequest;

  /// A chat boost was added or changed.
  ///
  /// The bot must be an administrator in the chat to receive these updates.
  ChatBoostUpdated? chatBoost;

  /// A boost was removed from a chat.
  ///
  /// The bot must be an administrator in the chat to receive these updates.
  ChatBoostRemoved? removedChatBoost;

  /// Basic constructor
  Update({
    required this.updateId,
    this.message,
    this.editedMessage,
    this.channelPost,
    this.editedChannelPost,
    this.businessConnection,
    this.businessMessage,
    this.editedBusinessMessage,
    this.deletedBusinessMessages,
    this.messageReaction,
    this.messageReactionCount,
    this.inlineQuery,
    this.chosenInlineResult,
    this.callbackQuery,
    this.shippingQuery,
    this.preCheckoutQuery,
    this.purchasedPaidMedia,
    this.poll,
    this.pollAnswer,
    this.myChatMember,
    this.chatMember,
    this.chatJoinRequest,
    this.chatBoost,
    this.removedChatBoost,
  });

  /// Creates an object from a json
  factory Update.fromJson(Map<String, dynamic> json) {
    return Update(
      updateId: json['update_id']!,
      message: callIfNotNull(
        Message.fromJson,
        json['message'],
      ),
      editedMessage: callIfNotNull(
        Message.fromJson,
        json['edited_message'],
      ),
      channelPost: callIfNotNull(
        Message.fromJson,
        json['channel_post'],
      ),
      editedChannelPost: callIfNotNull(
        Message.fromJson,
        json['edited_channel_post'],
      ),
      businessConnection: callIfNotNull(
        BusinessConnection.fromJson,
        json['business_connection'],
      ),
      businessMessage: callIfNotNull(
        Message.fromJson,
        json['business_message'],
      ),
      editedBusinessMessage: callIfNotNull(
        Message.fromJson,
        json['edited_business_message'],
      ),
      deletedBusinessMessages: callIfNotNull(
        BusinessMessagesDeleted.fromJson,
        json['deleted_business_messages'],
      ),
      messageReaction: callIfNotNull(
        MessageReactionUpdated.fromJson,
        json['message_reaction'],
      ),
      messageReactionCount: callIfNotNull(
        MessageReactionCountUpdated.fromJson,
        json['message_reaction_count'],
      ),
      inlineQuery: callIfNotNull(
        InlineQuery.fromJson,
        json['inline_query'],
      ),
      chosenInlineResult: callIfNotNull(
        ChosenInlineResult.fromJson,
        json['chosen_inline_result'],
      ),
      callbackQuery: callIfNotNull(
        CallbackQuery.fromJson,
        json['callback_query'],
      ),
      shippingQuery: callIfNotNull(
        ShippingQuery.fromJson,
        json['shipping_query'],
      ),
      preCheckoutQuery: callIfNotNull(
        PreCheckoutQuery.fromJson,
        json['pre_checkout_query'],
      ),
      purchasedPaidMedia: callIfNotNull(
        PaidMediaPurchased.fromJson,
        json['purchased_paid_media'],
      ),
      poll: callIfNotNull(
        Poll.fromJson,
        json['poll'],
      ),
      pollAnswer: callIfNotNull(
        PollAnswer.fromJson,
        json['poll_answer'],
      ),
      myChatMember: callIfNotNull(
        ChatMemberUpdated.fromJson,
        json['my_chat_member'],
      ),
      chatMember: callIfNotNull(
        ChatMemberUpdated.fromJson,
        json['chat_member'],
      ),
      chatJoinRequest: callIfNotNull(
        ChatJoinRequest.fromJson,
        json['chat_join_request'],
      ),
      chatBoost: callIfNotNull(
        ChatBoostUpdated.fromJson,
        json['chat_boost'],
      ),
      removedChatBoost: callIfNotNull(
        ChatBoostRemoved.fromJson,
        json['removed_chat_boost'],
      ),
    );
  }

  /// Creates a list of objects from a json array
  static List<Update> listFromJsonArray(List<dynamic> array) {
    return List.generate(
      array.length,
      (i) => Update.fromJson(array[i]),
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'update_id': updateId,
      'message': message,
      'edited_message': editedMessage,
      'channel_post': channelPost,
      'edited_channel_post': editedChannelPost,
      'business_connection': businessConnection,
      'business_message': businessMessage,
      'edited_business_message': editedBusinessMessage,
      'deleted_business_messages': deletedBusinessMessages,
      'message_reaction': messageReaction,
      'message_reaction_count': messageReactionCount,
      'inline_query': inlineQuery,
      'chosen_inline_result': chosenInlineResult,
      'callback_query': callbackQuery,
      'shipping_query': shippingQuery,
      'pre_checkout_query': preCheckoutQuery,
      'purchased_paid_media': purchasedPaidMedia,
      'poll': poll,
      'poll_answer': pollAnswer,
      'my_chat_member': myChatMember,
      'chat_member': chatMember,
      'chat_join_request': chatJoinRequest,
      'chat_boost': chatBoost,
      'removed_chat_boost': removedChatBoost,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
