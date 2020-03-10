import 'package:dart_telegram_bot/tgapi/entities/callback_query.dart';
import 'package:dart_telegram_bot/tgapi/entities/poll_answer.dart';
import 'package:dart_telegram_bot/tgapi/entities/pre_checkout_query.dart';
import 'package:dart_telegram_bot/tgapi/entities/shipping_query.dart';

import 'chosen_inline_result.dart';
import 'inline_query.dart';
import 'message.dart';
import 'poll.dart';

class Update {
  int updateId;
  Message message;
  Message editedMessage;
  Message channelPost;
  Message editedChannelPost;
  InlineQuery inlineQuery;
  ChosenInlineResult chosenInlineResult;
  CallbackQuery callbackQuery;
  ShippingQuery shippingQuery;
  PreCheckoutQuery preCheckoutQuery;
  Poll poll;
  PollAnswer pollAnswer;

  Update(this.updateId,
      {this.message,
      this.editedMessage,
      this.channelPost,
      this.editedChannelPost,
      this.inlineQuery,
      this.chosenInlineResult,
      this.callbackQuery,
      this.shippingQuery,
      this.preCheckoutQuery,
      this.poll,
      this.pollAnswer});

  factory Update.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return Update(json['update_id'],
        message: Message.fromJson(json['message']),
        editedMessage: Message.fromJson(json['edited_message']),
        channelPost: Message.fromJson(json['channel_post']),
        editedChannelPost: Message.fromJson(json['edited_channel_post']),
        inlineQuery: InlineQuery.fromJson(json['inline_query']),
        chosenInlineResult: ChosenInlineResult.fromJson(json['chosen_inline_result']),
        callbackQuery: CallbackQuery.fromJson(json['callback_query']),
        shippingQuery: ShippingQuery.fromJson(json['shipping_query']),
        preCheckoutQuery: PreCheckoutQuery.fromJson(json['pre_checkout_query']),
        poll: Poll.fromJson(json['poll']),
        pollAnswer: PollAnswer.fromJson(json['poll_answer']));
  }

  static List<Update> listFromJsonArray(List<dynamic> array) {
    if (array == null) return null;
    return List.generate(array.length, (i) => Update.fromJson(array[i]));
  }
}
