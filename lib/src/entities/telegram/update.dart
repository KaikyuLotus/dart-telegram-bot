import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

class Update {
  Stopwatch stopwatch = Stopwatch()..start();
  int updateId;
  Message? message;
  Message? editedMessage;
  Message? channelPost;
  Message? editedChannelPost;
  InlineQuery? inlineQuery;
  ChosenInlineResult? chosenInlineResult;
  CallbackQuery? callbackQuery;
  ShippingQuery? shippingQuery;
  PreCheckoutQuery? preCheckoutQuery;
  Poll? poll;
  PollAnswer? pollAnswer;
  ChatMemberUpdated? myChatMember;
  ChatMemberUpdated? chatMember;

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
  });

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
    );
  }

  static List<Update> listFromJsonArray(List<dynamic> array) {
    return List.generate(array.length, (i) => Update.fromJson(array[i]));
  }

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
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
