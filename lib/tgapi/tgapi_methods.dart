import 'package:dart_telegram_bot/tgapi/entities/update.dart';
import 'package:dart_telegram_bot/tgapi/enums/parse_mode.dart';
import 'package:dart_telegram_bot/tgapi/tgapi_client.dart';

import 'entities/message.dart';
import 'entities/user.dart';

class TGAPIMethods {
  final TGAPIClient _client = TGAPIClient();

  String _token;

  TGAPIMethods(String token) {
    _token = token;
  }

  Future<User> getMe() {
    return _client.apiCall(_token, 'getMe');
  }

  Future<List<Update>> getUpdates([int timeout, int offset]) {
    return _client
        .apiCall(_token, 'getUpdates', {'timeout': timeout, 'offset': offset});
  }

  // TODO reply markup
  Future<Message> sendMessage(int chatId, String text,
      [ParseMode parseMode,
      bool disableWebPagePreview,
      bool disableNotification,
      int replyToMessageId,
      replyMarkup]) {
    return _client.apiCall(_token, 'sendMessage', {
      'chat_id': chatId,
      'text': text,
      'parse_mode': parseMode,
      'disable_notification': disableNotification,
      'disable_web_page_preview': disableWebPagePreview,
      'reply_to_message_id': replyToMessageId,
      'reply_markup': replyMarkup
    });
  }
}
