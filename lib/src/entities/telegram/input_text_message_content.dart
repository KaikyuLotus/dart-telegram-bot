import 'package:dart_telegram_bot/dart_telegram_bot.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';

class InputTextMessageContent extends InputMessageContent {
  String messageText;
  ParseMode parseMode;
  bool disableWebPagePreview;

  InputTextMessageContent(
    this.messageText, {
    this.parseMode,
    this.disableWebPagePreview,
  });

  factory InputTextMessageContent.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return InputTextMessageContent(
      json['message_text'],
      parseMode: EnumHelper.decode(ParseMode.values, json['parse_mode']),
      disableWebPagePreview: json['disable_web_page_preview'],
    );
  }

  Map toJson() {
    var data = <String, dynamic>{};
    data['message_text'] = messageText;
    if (parseMode != null) data['parse_mode'] = EnumHelper.encode(parseMode);
    if (disableWebPagePreview != null) data['disable_web_page_preview'] = disableWebPagePreview;
    return data;
  }
}
