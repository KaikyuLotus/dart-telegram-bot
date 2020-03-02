import 'package:dart_telegram_bot/tgapi/entities/internal/http_file.dart';
import 'package:dart_telegram_bot/tgapi/entities/update.dart';
import 'package:dart_telegram_bot/tgapi/enums/parse_mode.dart';
import 'package:dart_telegram_bot/tgapi/exceptions/unsupported_type_exception.dart';
import 'package:dart_telegram_bot/tgapi/tgapi_client.dart';

import 'entities/message.dart';
import 'entities/user.dart';

class TGAPIMethods {
  final TGAPIClient _client = TGAPIClient();

  String _token;

  TGAPIMethods(String token) {
    _token = token;
  }

  // TODO find a better way to handle dynamic args?
  void _assertIsIntOrString(dynamic arg) {
    if (!(arg is String) && !(arg is int)) {
      throw UnsupportedTypeException('arg must be one of int or String');
    }
  }

  void _assertIsStringOrHttpFile(dynamic arg) {
    if (!(arg is String) && !(arg is HttpFile)) {
      throw UnsupportedTypeException('arg must be one of String or HttpFile');
    }
  }

  Future<User> getMe() {
    return _client.apiCall(_token, 'getMe');
  }

  Future<List<Update>> getUpdates({int timeout, int offset}) {
    return _client
        .apiCall(_token, 'getUpdates', {'timeout': timeout, 'offset': offset});
  }

  // TODO reply markup
  Future<Message> sendMessage(dynamic chatId, String text,
      {ParseMode parseMode,
      bool disableWebPagePreview,
      bool disableNotification,
      int replyToMessageId,
      replyMarkup}) {
    _assertIsIntOrString(chatId);
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

  // TODO reply markup
  Future<Message> sendPhoto(dynamic chatId, dynamic photo,
      {String caption,
      ParseMode parseMode,
      bool disableNotification,
      int replyToMessageId,
      replyMarkup}) {
    _assertIsIntOrString(chatId);
    _assertIsStringOrHttpFile(photo);
    return _client.apiCall(_token, 'sendPhoto', {
      'chat_id': chatId,
      'photo': photo,
      'caption': caption,
      'parse_mode': parseMode,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageId,
      'reply_markup': replyMarkup
    });
  }

  Future<Message> sendAudio(dynamic chatId, dynamic audio,
      {String caption,
        ParseMode parseMode,
        int duration,
        String performer,
        String title,
        dynamic thumb,
        bool disableNotification,
        int replyToMessageId,
        replyMarkup}) {
    _assertIsIntOrString(chatId);
    _assertIsStringOrHttpFile(audio);
    if (thumb != null) _assertIsStringOrHttpFile(thumb);
    return _client.apiCall(_token, 'sendAudio', {
      'chat_id': chatId,
      'audio': audio,
      'caption': caption,
      'parse_mode': parseMode,
      'duration': duration,
      'performer': performer,
      'title': title,
      'thumb': thumb,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageId,
      'reply_markup': replyMarkup
    });
  }

  Future<Message> sendDocument(dynamic chatId, dynamic document,
      {dynamic thumb,
        String caption,
        ParseMode parseMode,
        bool disableNotification,
        int replyToMessageId,
        replyMarkup}) {
    _assertIsIntOrString(chatId);
    _assertIsStringOrHttpFile(document);
    if (thumb != null) _assertIsStringOrHttpFile(thumb);
    return _client.apiCall(_token, 'sendDocument', {
      'chat_id': chatId,
      'document': document,
      'caption': caption,
      'parse_mode': parseMode,
      'thumb': thumb,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageId,
      'reply_markup': replyMarkup
    });
  }

  Future<Message> sendVideo(dynamic chatId, dynamic video,
      {int duration,
        int width,
        int height,
        dynamic thumb,
        String caption,
        ParseMode parseMode,
        bool supportsStreaming,
        bool disableNotification,
        int replyToMessageId,
        replyMarkup}) {
    _assertIsIntOrString(chatId);
    _assertIsStringOrHttpFile(video);
    if (thumb != null) _assertIsStringOrHttpFile(thumb);
    return _client.apiCall(_token, 'sendVideo', {
      'chat_id': chatId,
      'video': video,
      'duration': duration,
      'width': width,
      'height': height,
      'thumb': thumb,
      'caption': caption,
      'parse_mode': parseMode,
      'supports_streaming': supportsStreaming,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageId,
      'reply_markup': replyMarkup
    });
  }

  Future<Message> sendAnimation(dynamic chatId, dynamic animation,
      {int duration,
        int width,
        int height,
        dynamic thumb,
        String caption,
        ParseMode parseMode,
        bool disableNotification,
        int replyToMessageId,
        replyMarkup}) {
    _assertIsIntOrString(chatId);
    _assertIsStringOrHttpFile(animation);
    if (thumb != null) _assertIsStringOrHttpFile(thumb);
    return _client.apiCall(_token, 'sendAnimation', {
      'chat_id': chatId,
      'animation': animation,
      'duration': duration,
      'width': width,
      'height': height,
      'thumb': thumb,
      'caption': caption,
      'parse_mode': parseMode,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageId,
      'reply_markup': replyMarkup
    });
  }

  Future<Message> sendVoice(dynamic chatId, dynamic voice,
      {String caption,
        ParseMode parseMode,
        int duration,
        bool disableNotification,
        int replyToMessageId,
        replyMarkup}) {
    _assertIsIntOrString(chatId);
    _assertIsStringOrHttpFile(voice);
    return _client.apiCall(_token, 'sendVoice', {
      'chat_id': chatId,
      'voice': voice,
      'caption': caption,
      'parse_mode': parseMode,
      'duration': duration,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageId,
      'reply_markup': replyMarkup
    });
  }

  Future<Message> sendSticker(dynamic chatId, dynamic sticker,
      {bool disableNotification, int replyToMessageId, replyMarkup}) {
    _assertIsIntOrString(chatId);
    _assertIsStringOrHttpFile(sticker);
    return _client.apiCall(_token, 'sendSticker', {
      'chat_id': chatId,
      'sticker': sticker,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageId,
      'reply_markup': replyMarkup
    });
  }
}
