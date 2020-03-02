import 'package:dart_telegram_bot/tgapi/entities/Poll.dart';
import 'package:dart_telegram_bot/tgapi/entities/chat.dart';
import 'package:dart_telegram_bot/tgapi/entities/chat_member.dart';
import 'package:dart_telegram_bot/tgapi/entities/chat_permissions.dart';
import 'package:dart_telegram_bot/tgapi/entities/internal/http_file.dart';
import 'package:dart_telegram_bot/tgapi/entities/mask_position.dart';
import 'package:dart_telegram_bot/tgapi/entities/sticker_set.dart';
import 'package:dart_telegram_bot/tgapi/entities/update.dart';
import 'package:dart_telegram_bot/tgapi/enums/chat_action.dart';
import 'package:dart_telegram_bot/tgapi/enums/parse_mode.dart';
import 'package:dart_telegram_bot/tgapi/exceptions/malformed_api_call_exception.dart';
import 'package:dart_telegram_bot/tgapi/exceptions/unsupported_type_exception.dart';
import 'package:dart_telegram_bot/tgapi/tgapi_client.dart';

import 'entities/file.dart';
import 'entities/input_media.dart';
import 'entities/internal/chat_id.dart';
import 'entities/message.dart';
import 'entities/user.dart';
import 'entities/user_profile_photos.dart';

class TGAPIMethods {
  final TGAPIClient _client = TGAPIClient();

  String _token;

  TGAPIMethods(String token) {
    _token = token;
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
    return _client.apiCall(_token, 'getUpdates', {'timeout': timeout, 'offset': offset});
  }

  // TODO reply markup
  Future<Message> sendMessage(ChatID chatId, String text,
      {ParseMode parseMode, bool disableWebPagePreview, bool disableNotification, int replyToMessageId, replyMarkup}) {
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
  Future<Message> sendPhoto(ChatID chatId, dynamic photo,
      {String caption, ParseMode parseMode, bool disableNotification, int replyToMessageId, replyMarkup}) {
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

  Future<Message> sendAudio(ChatID chatId, dynamic audio,
      {String caption,
      ParseMode parseMode,
      int duration,
      String performer,
      String title,
      dynamic thumb,
      bool disableNotification,
      int replyToMessageId,
      replyMarkup}) {
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

  Future<Message> sendDocument(ChatID chatId, dynamic document,
      {dynamic thumb,
      String caption,
      ParseMode parseMode,
      bool disableNotification,
      int replyToMessageId,
      replyMarkup}) {
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

  Future<Message> sendVideo(ChatID chatId, dynamic video,
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

  Future<Message> sendAnimation(ChatID chatId, dynamic animation,
      {int duration,
      int width,
      int height,
      dynamic thumb,
      String caption,
      ParseMode parseMode,
      bool disableNotification,
      int replyToMessageId,
      replyMarkup}) {
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

  Future<Message> sendVoice(ChatID chatId, dynamic voice,
      {String caption,
      ParseMode parseMode,
      int duration,
      bool disableNotification,
      int replyToMessageId,
      replyMarkup}) {
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

  Future<Message> sendVideoNote(ChatID chatId, dynamic videoNote,
      {int duration, int length, dynamic thumb, bool disableNotification, int replyToMessageId, replyMarkup}) {
    _assertIsStringOrHttpFile(videoNote);
    if (thumb != null) _assertIsStringOrHttpFile(thumb);
    return _client.apiCall(_token, 'sendVideoNote', {
      'chat_id': chatId,
      'video_note': videoNote,
      'duration': duration,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageId,
      'reply_markup': replyMarkup
    });
  }

  // TODO List<InputMedia> must be implemented to work
  Future<Message> sendMediaGroup(ChatID chatId, List<InputMedia> media,
      {bool disableNotification, int replyToMessageId}) {
    return _client.apiCall(_token, 'sendMediaGroup', {
      'chat_id': chatId,
      'media': media,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageId
    });
  }

  Future<Message> sendLocation(ChatID chatId, double latitude, double longitude,
      {int livePeriod, bool disableNotification, int replyToMessageId, replyMarkup}) {
    return _client.apiCall(_token, 'sendLocation', {
      'chat_id': chatId,
      'latitude': latitude,
      'longitude': longitude,
      'live_period': livePeriod,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageId,
      'reply_markup': replyMarkup
    });
  }

  Future<Message> editMessageLiveLocation(double latitude, double longitude,
      {String inlineMessageId, ChatID chatId, int messageId, replyMarkup}) {
    // This check should be enough
    // TODO check if there's a better way
    if (inlineMessageId == null && (chatId == null || messageId == null)) {
      throw MalformedAPICallException('If inlineMessageId is null then chatId and messageId must be defined');
    }
    return _client.apiCall(_token, 'editMessageLiveLocation', {
      'chat_id': chatId,
      'message_id': messageId,
      'inline_message_id': inlineMessageId,
      'latitude': latitude,
      'longitude': longitude,
      'reply_markup': replyMarkup
    });
  }

  Future<Message> stopMessageLiveLocation({String inlineMessageId, ChatID chatId, int messageId, replyMarkup}) {
    // This check should be enough
    // TODO check if there's a better way
    if (inlineMessageId == null && (chatId == null || messageId == null)) {
      throw MalformedAPICallException('If inlineMessageId is null then chatId and messageId must be defined');
    }
    return _client.apiCall(_token, 'stopMessageLiveLocation', {
      'chat_id': chatId,
      'message_id': messageId,
      'inline_message_id': inlineMessageId,
      'reply_markup': replyMarkup
    });
  }

  Future<Message> sendVenue(ChatID chatId, double latitude, double longitude, String title, String address,
      {String foursquareId, String foursquareType, bool disableNotification, int replyToMessageId, replyMarkup}) {
    return _client.apiCall(_token, 'sendVenue', {
      'chat_id': chatId,
      'latitude': latitude,
      'longitude': longitude,
      'title': title,
      'address': address,
      'foursquare_id': foursquareId,
      'foursquare_type': foursquareType,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageId,
      'reply_markup': replyMarkup
    });
  }

  Future<Message> sendContact(ChatID chatId, String phone_number, String firstName,
      {String lastName, String vcard, bool disableNotification, int replyToMessageId, replyMarkup}) {
    return _client.apiCall(_token, 'sendContact', {
      'chat_id': chatId,
      'phone_number': phone_number,
      'first_name': firstName,
      'last_name': lastName,
      'vcard': vcard,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageId,
      'reply_markup': replyMarkup
    });
  }

  Future<Message> sendPoll(ChatID chatId, String question, List<String> options,
      {bool isAnonymous,
      String type,
      bool allowsMultipleAnswers,
      int correctOptionId,
      bool isClosed,
      bool disableNotification,
      int replyToMessageId,
      replyMarkup}) {
    return _client.apiCall(_token, 'sendPoll', {
      'chat_id': chatId,
      'question': question,
      'options': options,
      'is_anonymous': isAnonymous,
      'type': type,
      'allows_multiple_answers': allowsMultipleAnswers,
      'correct_option_id': correctOptionId,
      'is_closed': isClosed,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageId,
      'reply_markup': replyMarkup
    });
  }

  Future<bool> sendChatAction(ChatID chatId, ChatAction action) {
    return _client.apiCall(_token, 'sendChatAction', {'chat_id': chatId, 'action': action});
  }

  Future<UserProfilePhotos> getUserProfilePhotos(ChatID chatId, {int offset, int limit}) {
    return _client.apiCall(_token, 'getUserProfilePhotos', {'chat_id': chatId, 'offset': offset, 'limit': limit});
  }

  // TODO this method should be ok but check the docs for further clarification?
  Future<File> getFile(String fileId) {
    return _client.apiCall(_token, 'getFile', {'file_id': fileId});
  }

  Future<bool> kickChatMember(ChatID chatId, int userId, {int untilDate}) {
    return _client.apiCall(_token, 'kickChatMember', {'chat_id': chatId, 'user_id': userId, 'until_date': untilDate});
  }

  Future<bool> unbanChatMember(ChatID chatId, int userId) {
    return _client.apiCall(_token, 'unbanChatMember', {'chat_id': chatId, 'user_id': userId});
  }

  Future<bool> restrictChatMember(ChatID chatId, int userId, ChatPermissions permissions, {int untilDate}) {
    return _client.apiCall(_token, 'restrictChatMember',
        {'chat_id': chatId, 'user_id': userId, 'permissions': permissions, 'until_date': untilDate});
  }

  Future<bool> promoteChatMember(ChatID chatId, int userId,
      {bool canChangeInfo,
      bool canPostMessages,
      bool canEditMessages,
      bool canDeleteMessages,
      bool canInviteUsers,
      bool canRestrictMembers,
      bool canPinMessages,
      bool canPromoteMembers}) {
    return _client.apiCall(_token, 'promoteChatMember', {
      'chat_id': chatId,
      'user_id': userId,
      'can_change_info': canChangeInfo,
      'can_post_messages': canPostMessages,
      'can_edit_messages': canEditMessages,
      'can_delete_messages': canDeleteMessages,
      'can_invite_users': canInviteUsers,
      'can_restrict_members': canRestrictMembers,
      'can_pin_messages': canPinMessages,
      'can_promote_members': canPromoteMembers
    });
  }

  Future<bool> setChatAdministratorCustomTitle(ChatID chatId, int userId, String customTitle) {
    return _client.apiCall(
        _token, 'setChatAdministratorCustomTitle', {'chat_id': chatId, 'user_id': userId, 'custom_title': customTitle});
  }

  Future<bool> setChatPermissions(ChatID chatId, ChatPermissions permissions) {
    return _client.apiCall(_token, 'setChatPermissions', {'chat_id': chatId, 'permissions': permissions});
  }

  Future<String> exportChatInviteLink(ChatID chatId) {
    return _client.apiCall(_token, 'exportChatInviteLink', {'chat_id': chatId});
  }

  Future<bool> setChatPhoto(ChatID chatId, HttpFile photo) {
    return _client.apiCall(_token, 'setChatPhoto', {'chat_id': chatId, 'photo': photo});
  }

  Future<bool> deleteChatPhoto(ChatID chatId) {
    return _client.apiCall(_token, 'deleteChatPhoto', {'chat_id': chatId});
  }

  Future<bool> setChatTitle(ChatID chatId, String title) {
    return _client.apiCall(_token, 'setChatTitle', {'chat_id': chatId, 'title': title});
  }

  Future<bool> setChatDescription(ChatID chatId, String description) {
    return _client.apiCall(_token, 'setChatDescription', {'chat_id': chatId, 'description': description});
  }

  Future<bool> pinChatMessage(ChatID chatId, String messageId, {bool disableNotification}) {
    return _client.apiCall(_token, 'pinChatMessage',
        {'chat_id': chatId, 'message_id': messageId, 'disable_notification': disableNotification});
  }

  Future<bool> unpinChatMessage(ChatID chatId) {
    return _client.apiCall(_token, 'unpinChatMessage', {'chat_id': chatId});
  }

  Future<bool> leaveChat(ChatID chatId) {
    return _client.apiCall(_token, 'leaveChat', {'chat_id': chatId});
  }

  Future<Chat> getChat(ChatID chatId) {
    return _client.apiCall(_token, 'getChat', {'chat_id': chatId});
  }

  Future<List<ChatMember>> getChatAdministrators(ChatID chatId) {
    return _client.apiCall(_token, 'getChatAdministrators', {'chat_id': chatId});
  }

  Future<int> getChatMembersCount(ChatID chatId) {
    return _client.apiCall(_token, 'getChatMembersCount', {'chat_id': chatId});
  }

  Future<ChatMember> getChatMember(ChatID chatId, String userId) {
    return _client.apiCall(_token, 'getChatMember', {'chat_id': chatId, 'user_id': userId});
  }

  Future<bool> setChatStickerSet(ChatID chatId, String stickerSetName) {
    return _client.apiCall(_token, 'setChatStickerSet', {'chat_id': chatId, 'sticker_set_name': stickerSetName});
  }

  Future<bool> deleteChatStickerSet(ChatID chatId) {
    return _client.apiCall(_token, 'deleteChatStickerSet', {'chat_id': chatId});
  }

  Future<bool> answerCallbackQuery(String callbackQueryId, {String text, bool showAlert, String url, int cacheTime}) {
    return _client.apiCall(_token, 'answerCallbackQuery', {
      'callback_query_id': callbackQueryId,
      'text': text,
      'show_alert': showAlert,
      'url': url,
      'cache_time': cacheTime
    });
  }

  Future<Poll> stopPoll(ChatID chatId, int messageId, {replyMarkup}) {
    return _client
        .apiCall(_token, 'stopPoll', {'chat_id': chatId, 'message_id': messageId, 'reply_markup': replyMarkup});
  }

  Future<Poll> deleteMessage(ChatID chatId, int messageId) {
    return _client.apiCall(_token, 'deleteMessage', {'chat_id': chatId, 'message_id': messageId});
  }

  Future<StickerSet> getStickerSet(String name) {
    return _client.apiCall(_token, 'getStickerSet', {'name': name});
  }

  // TODO not sure if HttpFile works here?
  Future<File> uploadStickerFile(String userId, HttpFile pngSticker) {
    return _client.apiCall(_token, 'uploadStickerFile', {'user_id': userId, 'png_sticker': pngSticker});
  }

  Future<bool> createNewStickerSet(String userId, String name, String title, dynamic pngSticker, String emojis,
      {bool containsMasks, MaskPosition maskPosition}) {
    _assertIsStringOrHttpFile(pngSticker);
    return _client.apiCall(_token, 'createNewStickerSet', {
      'user_id': userId,
      'name': name,
      'title': title,
      'png_sticker': pngSticker,
      'emojis': emojis,
      'contains_masks': containsMasks,
      'mask_position': maskPosition
    });
  }

  Future<bool> addStickerToSet(String userId, String name, dynamic pngSticker, String emojis,
      {MaskPosition maskPosition}) {
    _assertIsStringOrHttpFile(pngSticker);
    return _client.apiCall(_token, 'addStickerToSet',
        {'user_id': userId, 'name': name, 'png_sticker': pngSticker, 'emojis': emojis, 'mask_position': maskPosition});
  }

  Future<File> setStickerPositionInSet(String sticker, int position) {
    return _client.apiCall(_token, 'setStickerPositionInSet', {'sticker': sticker, 'position': position});
  }

  Future<File> deleteStickerFromSet(String sticker) {
    return _client.apiCall(_token, 'deleteStickerFromSet', {'sticker': sticker});
  }

  Future<Message> sendSticker(ChatID chatId, dynamic sticker,
      {bool disableNotification, int replyToMessageId, replyMarkup}) {
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
