import 'package:dart_telegram_bot/tgapi/entities/input_message_content.dart';

class InputTextMessageContent extends InputMessageContent {
  String messageText;
  String parseMode;
  bool disableWebPagePreview;

  InputTextMessageContent(this.messageText, {this.parseMode, this.disableWebPagePreview});

  factory InputTextMessageContent.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return InputTextMessageContent(
        json['message_text'],
        parseMode: json['parse_mode'],
        disableWebPagePreview: json['disable_web_page_preview']);
  }

  Map toJson() {
    var data = <String, dynamic>{};
    data['message_text'] = messageText;
    if (parseMode != null) data['parse_mode'] = parseMode;
    if (disableWebPagePreview != null) data['disable_web_page_preview'] = disableWebPagePreview;
    return data;
  }
}
