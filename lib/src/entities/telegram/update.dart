import 'package:dart_telegram_bot/src/entities/internal/helpers/util.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';

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
  });

  static Update fromJson(Map<String, dynamic> json) {
    return Update(
      updateId: json['update_id']!,
      message: callIfNotNull(Message.fromJson, json['message']),
      editedMessage: callIfNotNull(Message.fromJson, json['edited_message']),
      channelPost: callIfNotNull(Message.fromJson, json['channel_post']),
      editedChannelPost: callIfNotNull(Message.fromJson, json['edited_channel_post']),
      inlineQuery: callIfNotNull(InlineQuery.fromJson, json['inline_query']),
      chosenInlineResult: callIfNotNull(ChosenInlineResult.fromJson, json['chosen_inline_result']),
      callbackQuery: callIfNotNull(CallbackQuery.fromJson, json['callback_query']),
      shippingQuery: callIfNotNull(ShippingQuery.fromJson, json['shipping_query']),
      preCheckoutQuery: callIfNotNull(PreCheckoutQuery.fromJson, json['pre_checkout_query']),
      poll: callIfNotNull(Poll.fromJson, json['poll']),
      pollAnswer: callIfNotNull(PollAnswer.fromJson, json['poll_answer']),
    );
  }

  static List<Update> listFromJsonArray(List<dynamic> array) {
    return List.generate(array.length, (i) => Update.fromJson(array[i]));
  }
}
