import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// This object represents an incoming update.
/// At most one of the optional parameters can be present in any given update.
class Update {
  /// The update's unique identifier.
  /// Update identifiers start from a certain positive number and increase
  /// sequentially.
  /// This ID becomes especially handy if you're using webhooks, since it allows
  /// you to ignore repeated updates or to restore the correct update sequence,
  /// should they get out of order.
  /// If there are no new updates for at least a week,
  /// then identifier of the next update will be chosen randomly instead
  /// of sequentially.
  int updateId;

  /// Optional.
  /// New incoming message of any kind - text, photo, sticker, etc.
  Message? message;

  /// Optional.
  /// New version of a message that is known to the bot and was edited
  Message? editedMessage;

  /// Optional.
  /// New incoming channel post of any kind - text, photo, sticker, etc.
  Message? channelPost;

  /// Optional.
  /// New version of a channel post that is known to the bot and was edited
  Message? editedChannelPost;

  /// Optional.
  /// New incoming inline query
  InlineQuery? inlineQuery;

  /// Optional.
  /// The result of an inline query that was chosen by a user and sent to their
  /// chat partner.
  /// Please see our documentation on the feedback collecting for details on
  /// how to enable these updates for your bot.
  ChosenInlineResult? chosenInlineResult;

  /// Optional.
  /// New incoming callback query
  CallbackQuery? callbackQuery;

  /// Optional.
  /// New incoming shipping query. Only for invoices with flexible price
  ShippingQuery? shippingQuery;

  /// Optional.
  /// New incoming pre-checkout query. Contains full information about checkout
  PreCheckoutQuery? preCheckoutQuery;

  /// Optional.
  /// New poll state.
  /// Bots receive only updates about stopped polls and polls,
  /// which are sent by the bot
  Poll? poll;

  /// Optional.
  /// A user changed their answer in a non-anonymous poll.
  /// Bots receive new votes only in polls that were sent by the bot itself.
  PollAnswer? pollAnswer;

  /// Optional.
  /// The bot's chat member status was updated in a chat.
  /// For private chats, this update is received only when the bot is blocked
  /// or unblocked by the user.
  ChatMemberUpdated? myChatMember;

  /// Optional.
  /// A chat member's status was updated in a chat.
  /// The bot must be an administrator in the chat and must explicitly specify
  /// “chat_member” in the list of allowed_updates to receive these updates.
  ChatMemberUpdated? chatMember;

  /// Optional.
  /// A request to join the chat has been sent.
  /// The bot must have the can_invite_users administrator right in the chat to
  /// receive these updates.
  ChatJoinRequest? chatJoinRequest;

  /// Basic constructor
  Update({
    required this.updateId,
    this.message,
    this.editedMessage,
    this.channelPost,
    this.editedChannelPost,
    this.inlineQuery,
    this.chosenInlineResult,
    this.callbackQuery,
    this.shippingQuery,
    this.preCheckoutQuery,
    this.poll,
    this.pollAnswer,
    this.myChatMember,
    this.chatMember,
    this.chatJoinRequest,
  });

  /// Creates a object from a json
  static Update fromJson(Map<String, dynamic> json) {
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
    );
  }

  /// Creates a list of object from a json array
  static List<Update> listFromJsonArray(List<dynamic> array) {
    return List.generate(array.length, (i) => Update.fromJson(array[i]));
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'update_id': updateId,
      'message': message,
      'edited_message': editedMessage,
      'channel_post': channelPost,
      'edited_channel_post': editedChannelPost,
      'inline_query': inlineQuery,
      'chosen_inline_result': chosenInlineResult,
      'callback_query': callbackQuery,
      'shipping_query': shippingQuery,
      'pre_checkout_query': preCheckoutQuery,
      'poll': poll,
      'poll_answer': pollAnswer,
      'my_chat_member': myChatMember,
      'chat_member': chatMember,
      'chat_join_request': chatJoinRequest,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
