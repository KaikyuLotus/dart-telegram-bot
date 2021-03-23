import 'dart:typed_data';

import 'package:dart_telegram_bot/dart_telegram_bot.dart';
import 'package:dart_telegram_bot/src/entities/internal/tgapi_client.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';

class TGAPIMethods  {
  final _client = TGAPIClient();

  late String _token;

  void closeClient() => _client.close();

  void setup(String token) => _token = token;

  Future<User> getMe() {
    return _client.apiCall(_token, 'getMe');
  }

  Future<List<Update>> getUpdates({
    int? timeout,
    int? offset,
    int? limit,
    List<UpdateType>? allowedUpdates,
  }) {
    return _client.apiCall(_token, 'getUpdates', {
      'timeout': timeout,
      'offset': offset,
      'limit': limit,
      'allowed_updates': allowedUpdates,
    });
  }

  Future<Message> sendMessage(ChatID chatId, String text,
      {ParseMode? parseMode,
      bool? disableWebPagePreview,
      bool? disableNotification,
      int? replyToMessageId,
      bool? allowSendingWithoutReply,
      ReplyMarkup? replyMarkup}) {
    return _client.apiCall(_token, 'sendMessage', {
      'chat_id': chatId,
      'text': text,
      'parse_mode': parseMode,
      'disable_notification': disableNotification,
      'disable_web_page_preview': disableWebPagePreview,
      'reply_to_message_id': replyToMessageId,
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup
    });
  }

  Future<Message> copyMessage(
    ChatID chatId,
    ChatID fromChatId,
    int messageId, {
    String? caption,
    ParseMode? parseMode,
    List<MessageEntity>? captionEntities,
    bool? disableNotification,
    int? replyToMessageId,
    bool? allowSendingWithoutReply,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'copyMessage', {
      'chat_id': chatId,
      'from_chat_id': fromChatId,
      'message_id': messageId,
      'caption': caption,
      'parse_mode': parseMode,
      'caption_entities': captionEntities,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageId,
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup,
    });
  }

  Future<Message> sendPhoto(
    ChatID chatId,
    HttpFile photo, {
    String? caption,
    ParseMode? parseMode,
    bool? disableNotification,
    int? replyToMessageId,
    bool? allowSendingWithoutReply,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'sendPhoto', {
      'chat_id': chatId,
      'photo': photo,
      'caption': caption,
      'parse_mode': parseMode,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageId,
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup
    });
  }

  Future<Message> sendAudio(
    ChatID chatId,
    HttpFile audio, {
    String? caption,
    ParseMode? parseMode,
    int? duration,
    String? performer,
    String? title,
    HttpFile? thumb,
    bool? disableNotification,
    int? replyToMessageId,
    bool? allowSendingWithoutReply,
    ReplyMarkup? replyMarkup,
  }) {
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
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup
    });
  }

  Future<Message> sendDocument(
    ChatID chatId,
    HttpFile document, {
    HttpFile? thumb,
    String? caption,
    ParseMode? parseMode,
    bool? disableNotification,
    int? replyToMessageId,
    bool? allowSendingWithoutReply,
    ReplyMarkup? replyMarkup,
    bool? disableContentTypeDetection,
  }) {
    return _client.apiCall(_token, 'sendDocument', {
      'chat_id': chatId,
      'document': document,
      'caption': caption,
      'parse_mode': parseMode,
      'thumb': thumb,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageId,
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup,
      'disable_content_type_detection': disableContentTypeDetection,
    });
  }

  Future<Message> sendVideo(
    ChatID chatId,
    HttpFile video, {
    int? duration,
    int? width,
    int? height,
    HttpFile? thumb,
    String? caption,
    ParseMode? parseMode,
    bool? supportsStreaming,
    bool? disableNotification,
    int? replyToMessageId,
    bool? allowSendingWithoutReply,
    ReplyMarkup? replyMarkup,
  }) {
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
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup
    });
  }

  Future<Message> sendAnimation(
    ChatID chatId,
    HttpFile animation, {
    int? duration,
    int? width,
    int? height,
    HttpFile? thumb,
    String? caption,
    ParseMode? parseMode,
    bool? disableNotification,
    int? replyToMessageId,
    bool? allowSendingWithoutReply,
    ReplyMarkup? replyMarkup,
  }) {
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
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup
    });
  }

  Future<Message> sendVoice(
    ChatID chatId,
    HttpFile voice, {
    String? caption,
    ParseMode? parseMode,
    int? duration,
    bool? disableNotification,
    int? replyToMessageId,
    bool? allowSendingWithoutReply,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'sendVoice', {
      'chat_id': chatId,
      'voice': voice,
      'caption': caption,
      'parse_mode': parseMode,
      'duration': duration,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageId,
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup
    });
  }

  Future<Message> sendVideoNote(
    ChatID chatId,
    HttpFile videoNote, {
    int? duration,
    int? length,
    HttpFile? thumb,
    bool? disableNotification,
    int? replyToMessageId,
    bool? allowSendingWithoutReply,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'sendVideoNote', {
      'chat_id': chatId,
      'video_note': videoNote,
      'duration': duration,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageId,
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup
    });
  }

  Future<List<Message>> sendMediaGroup(
    ChatID chatId,
    List<InputMedia> media, {
    bool? disableNotification,
    bool? allowSendingWithoutReply,
    int? replyToMessageId,
  }) {
    return _client.apiCall(_token, 'sendMediaGroup', {
      'chat_id': chatId,
      'media': media,
      'disable_notification': disableNotification,
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_to_message_id': replyToMessageId
    });
  }

  Future<Message> sendLocation(
    ChatID chatId,
    double latitude,
    double longitude, {
    int? livePeriod,
    bool? disableNotification,
    int? replyToMessageId,
    bool? allowSendingWithoutReply,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'sendLocation', {
      'chat_id': chatId,
      'latitude': latitude,
      'longitude': longitude,
      'live_period': livePeriod,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageId,
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup
    });
  }

  Future<Message> editMessageLiveLocation(
    double latitude,
    double longitude, {
    String? inlineMessageId,
    ChatID? chatId,
    int? messageId,
    ReplyMarkup? replyMarkup,
  }) {
    if (inlineMessageId == null && (chatId == null || messageId == null)) {
      throw MalformedAPICallException(
        'If inlineMessageId is null then chatId and messageId must be defined',
      );
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

  Future<Message> stopMessageLiveLocation({
    String? inlineMessageId,
    ChatID? chatId,
    int? messageId,
    ReplyMarkup? replyMarkup,
  }) {
    if (inlineMessageId == null && (chatId == null || messageId == null)) {
      throw MalformedAPICallException(
        'If inlineMessageId is null then chatId and messageId must be defined',
      );
    }
    return _client.apiCall(_token, 'stopMessageLiveLocation', {
      'chat_id': chatId,
      'message_id': messageId,
      'inline_message_id': inlineMessageId,
      'reply_markup': replyMarkup
    });
  }

  Future<Message> sendVenue(
    ChatID chatId,
    double latitude,
    double longitude,
    String title,
    String address, {
    String? foursquareId,
    String? foursquareType,
    bool? disableNotification,
    int? replyToMessageId,
    bool? allowSendingWithoutReply,
    ReplyMarkup? replyMarkup,
  }) {
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
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup
    });
  }

  Future<Message> sendContact(
    ChatID chatId,
    String phoneNumber,
    String? firstName, {
    String? lastName,
    String? vcard,
    bool? disableNotification,
    int? replyToMessageId,
    bool? allowSendingWithoutReply, //Asendinvoice
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'sendContact', {
      'chat_id': chatId,
      'phone_number': phoneNumber,
      'first_name': firstName,
      'last_name': lastName,
      'vcard': vcard,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageId,
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup
    });
  }

  Future<Message> sendPoll(
    ChatID chatId,
    String question,
    List<String> options, {
    bool? isAnonymous,
    String? type,
    bool? allowsMultipleAnswers,
    int? correctOptionId,
    bool? isClosed,
    bool? disableNotification,
    int? replyToMessageId,
    bool? allowSendingWithoutReply,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(
      _token,
      'sendPoll',
      {
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
        'allow_sending_without_reply': allowSendingWithoutReply,
        'reply_markup': replyMarkup
      },
    );
  }

  Future<bool> sendChatAction(ChatID chatId, ChatAction action) {
    return _client.apiCall(
      _token,
      'sendChatAction',
      {'chat_id': chatId, 'action': action},
    );
  }

  Future<UserProfilePhotos> getUserProfilePhotos(
    ChatID chatId, {
    int? offset,
    int? limit,
  }) {
    return _client.apiCall(_token, 'getUserProfilePhotos', {
      'chat_id': chatId,
      'offset': offset,
      'limit': limit,
    });
  }

  Future<File> getFile(String fileId) {
    return _client.apiCall(_token, 'getFile', {'file_id': fileId});
  }

  Future<bool> kickChatMember(
    ChatID chatId,
    int userId, {
    int? untilDate,
    bool? revokeMessages,
  }) {
    return _client.apiCall(_token, 'kickChatMember', {
      'chat_id': chatId,
      'user_id': userId,
      'until_date': untilDate,
      'revoke_messages': revokeMessages,
    });
  }

  Future<bool> unbanChatMember(
    ChatID chatId,
    int userId, {
    bool? onlyIfBanned,
  }) {
    return _client.apiCall(_token, 'unbanChatMember', {
      'chat_id': chatId,
      'user_id': userId,
      'only_if_banned': onlyIfBanned,
    });
  }

  Future<bool> restrictChatMember(
    ChatID chatId,
    int userId,
    ChatPermissions permissions, {
    int? untilDate,
  }) {
    return _client.apiCall(_token, 'restrictChatMember', {
      'chat_id': chatId,
      'user_id': userId,
      'permissions': permissions,
      'until_date': untilDate,
    });
  }

  Future<bool> promoteChatMember(
    ChatID chatId,
    int userId, {
    bool? isAnonymous,
    bool? canChangeInfo,
    bool? canPostMessages,
    bool? canEditMessages,
    bool? canDeleteMessages,
    bool? canInviteUsers,
    bool? canRestrictMembers,
    bool? canPinMessages,
    bool? canPromoteMembers,
    bool? canManageVoiceChats,
    bool? canManageChat,
  }) {
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
      'can_promote_members': canPromoteMembers,
      'can_manage_voice_chats': canManageVoiceChats,
      'can_manage_chat': canManageChat,
      'is_anonymous': isAnonymous,
    });
  }

  Future<bool> setChatAdministratorCustomTitle(
    ChatID chatId,
    int userId,
    String customTitle,
  ) {
    return _client.apiCall(_token, 'setChatAdministratorCustomTitle', {
      'chat_id': chatId,
      'user_id': userId,
      'custom_title': customTitle,
    });
  }

  Future<bool> setChatPermissions(ChatID chatId, ChatPermissions permissions) {
    return _client.apiCall(_token, 'setChatPermissions', {
      'chat_id': chatId,
      'permissions': permissions,
    });
  }

  Future<String> exportChatInviteLink(ChatID chatId) {
    return _client.apiCall(_token, 'exportChatInviteLink', {
      'chat_id': chatId,
    });
  }

  Future<bool> setChatPhoto(ChatID chatId, HttpFile photo) {
    return _client.apiCall(_token, 'setChatPhoto', {
      'chat_id': chatId,
      'photo': photo,
    });
  }

  Future<bool> deleteChatPhoto(ChatID chatId) {
    return _client.apiCall(_token, 'deleteChatPhoto', {
      'chat_id': chatId,
    });
  }

  Future<bool> setChatTitle(ChatID chatId, String title) {
    return _client.apiCall(_token, 'setChatTitle', {
      'chat_id': chatId,
      'title': title,
    });
  }

  Future<bool> setChatDescription(ChatID chatId, String description) {
    return _client.apiCall(_token, 'setChatDescription', {
      'chat_id': chatId,
      'description': description,
    });
  }

  Future<bool> pinChatMessage(
    ChatID chatId,
    int messageId, {
    bool? disableNotification,
  }) {
    return _client.apiCall(_token, 'pinChatMessage', {
      'chat_id': chatId,
      'message_id': messageId,
      'disable_notification': disableNotification,
    });
  }

  Future<bool> unpinChatMessage(ChatID chatId, {int? messageId}) {
    return _client.apiCall(_token, 'unpinChatMessage', {
      'chat_id': chatId,
      'message_id': messageId,
    });
  }

  Future<bool> unpinAllChatMessages(ChatID chatId) {
    return _client.apiCall(_token, 'unpinAllChatMessages', {
      'chat_id': chatId,
    });
  }

  Future<bool> leaveChat(ChatID chatId) {
    return _client.apiCall(_token, 'leaveChat', {
      'chat_id': chatId,
    });
  }

  Future<Chat> getChat(ChatID chatId) {
    return _client.apiCall(_token, 'getChat', {
      'chat_id': chatId,
    });
  }

  Future<List<ChatMember>> getChatAdministrators(ChatID chatId) {
    return _client.apiCall(_token, 'getChatAdministrators', {
      'chat_id': chatId,
    });
  }

  Future<int> getChatMembersCount(ChatID chatId) {
    return _client.apiCall(_token, 'getChatMembersCount', {
      'chat_id': chatId,
    });
  }

  Future<ChatMember> getChatMember(ChatID chatId, int userId) {
    return _client.apiCall(_token, 'getChatMember', {
      'chat_id': chatId,
      'user_id': userId,
    });
  }

  Future<bool> setChatStickerSet(ChatID chatId, String stickerSetName) {
    return _client.apiCall(_token, 'setChatStickerSet', {
      'chat_id': chatId,
      'sticker_set_name': stickerSetName,
    });
  }

  Future<bool> deleteChatStickerSet(ChatID chatId) {
    return _client.apiCall(_token, 'deleteChatStickerSet', {
      'chat_id': chatId,
    });
  }

  Future<bool> answerCallbackQuery(
    String callbackQueryId, {
    String? text,
    bool? showAlert,
    String? url,
    int? cacheTime,
  }) {
    return _client.apiCall(_token, 'answerCallbackQuery', {
      'callback_query_id': callbackQueryId,
      'text': text,
      'show_alert': showAlert,
      'url': url,
      'cache_time': cacheTime
    });
  }

  Future<Poll> stopPoll(
    ChatID chatId,
    int messageId, {
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'stopPoll', {
      'chat_id': chatId,
      'message_id': messageId,
      'reply_markup': replyMarkup,
    });
  }

  Future<bool> deleteMessage(ChatID chatId, int messageId) {
    return _client.apiCall(_token, 'deleteMessage', {
      'chat_id': chatId,
      'message_id': messageId,
    });
  }

  Future<StickerSet> getStickerSet(String name) {
    return _client.apiCall(_token, 'getStickerSet', {'name': name});
  }

  Future<File> uploadStickerFile(String userId, HttpFile pngSticker) {
    return _client.apiCall(_token, 'uploadStickerFile', {
      'user_id': userId,
      'png_sticker': pngSticker,
    });
  }

  Future<bool> createNewStickerSet(
    String userId,
    String name,
    String title,
    HttpFile pngSticker,
    String emojis, {
    bool? containsMasks,
    MaskPosition? maskPosition,
  }) {
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

  Future<bool> addStickerToSet(
    String userId,
    String name,
    HttpFile pngSticker,
    String emojis, {
    MaskPosition? maskPosition,
  }) {
    return _client.apiCall(_token, 'addStickerToSet', {
      'user_id': userId,
      'name': name,
      'png_sticker': pngSticker,
      'emojis': emojis,
      'mask_position': maskPosition,
    });
  }

  Future<bool> setStickerPositionInSet(String sticker, int position) {
    return _client.apiCall(_token, 'setStickerPositionInSet', {
      'sticker': sticker,
      'position': position,
    });
  }

  Future<bool> deleteStickerFromSet(String sticker) {
    return _client.apiCall(_token, 'deleteStickerFromSet', {
      'sticker': sticker,
    });
  }

  Future<bool> answerInlineQuery(
    String inlineQueryId,
    List<InlineQueryResult> results, {
    int? cacheTime,
    bool? isPersonal,
    String? nextOffset,
    String? switchPmText,
    String? switchPmParameter,
  }) {
    return _client.apiCall(_token, 'answerInlineQuery', {
      'inline_query_id': inlineQueryId,
      'results': results,
      'cache_time': cacheTime,
      'is_personal': isPersonal,
      'next_offset': nextOffset,
      'switch_pm_text': switchPmText,
      'switch_pm_parameter': switchPmParameter,
    });
  }

  Future<Message> sendSticker(
    ChatID chatId,
    HttpFile sticker, {
    bool? disableNotification,
    int? replyToMessageId,
    bool? allowSendingWithoutReply,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'sendSticker', {
      'chat_id': chatId,
      'sticker': sticker,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageId,
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup
    });
  }

  Future<bool> setMyCommands(List<BotCommand> botCommands) {
    return _client.apiCall(_token, 'setMyCommands', {
      'commands': botCommands,
    });
  }

  Future<List<BotCommand>> getMyCommands() {
    return _client.apiCall(_token, 'getMyCommands');
  }

  Future<Message> editMessageText(
    String text, {
    ChatID? chatId,
    int? messageId,
    String? inlineMessageId,
    ParseMode? parseMode,
    bool? disableWebPagePreview,
    ReplyMarkup? replyMarkup,
  }) {
    if (inlineMessageId == null && (chatId == null || messageId == null)) {
      throw MalformedAPICallException(
        'If inlineMessageId is null then chatId and messageId must be defined',
      );
    }

    return _client.apiCall(_token, 'editMessageText', {
      'chat_id': chatId,
      'message_id': messageId,
      'inline_message_id': inlineMessageId,
      'text': text,
      'parse_mode': parseMode,
      'disable_web_page_preview': disableWebPagePreview,
      'reply_markup': replyMarkup
    });
  }

  Future<Message> sendDice(
    ChatID chatId, {
    Emoji? emoji,
    bool? disableNotification,
    int? replyToMessageId,
    bool? allowSendingWithoutReply,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'sendDice', {
      'chat_id': chatId,
      'emoji': emoji,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageId,
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup,
    });
  }

  Future<Message> sendGame(
    ChatID chatId,
    String gameShortName, {
    bool? disableNotification,
    int? replyToMessageId,
    bool? allowSendingWithoutReply,
    InlineKeyboardMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'sendGame', {
      'chat_id': chatId,
      'game_short_name': gameShortName,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageId,
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup,
    });
  }

  Future<Message> sendInvoice(
    ChatID chatId,
    String title,
    String description,
    String payload,
    String providerToken,
    String startParameter,
    String currency,
    List<LabeledPrice> prices, {
    String? providerData,
    String? photoUrl,
    int? photoSize,
    int? photoWidth,
    int? photoHeight,
    bool? needName,
    bool? needPhoneNumber,
    bool? needEmail,
    bool? needShippingAddress,
    bool? sendPhoneNumberToProvider,
    bool? sendEmailToProvider,
    bool? isFlexible,
    bool? disableNotification,
    int? replyToMessageId,
    bool? allowSendingWithoutReply,
    InlineKeyboardMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'sendInvoice', {
      'chat_id': chatId,
      'title': title,
      'description': description,
      'payload': payload,
      'provider_token': providerToken,
      'start_parameter': startParameter,
      'currency': currency,
      'prices': prices,
      'provider_data': providerData,
      'photo_url': photoUrl,
      'photo_size': photoSize,
      'photo_width': photoWidth,
      'photo_height': photoHeight,
      'need_name': needName,
      'need_phone_number': needPhoneNumber,
      'need_email': needEmail,
      'need_shipping_address': needShippingAddress,
      'send_phone_number_to_provider': sendPhoneNumberToProvider,
      'send_email_to_provider': sendEmailToProvider,
      'is_flexible': isFlexible,
      'reply_to_message_id': replyToMessageId,
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup,
    });
  }

  Future<ChatInviteLink> createChatInviteLink(
    ChatID chatId, {
    int? expireDate,
    int? memberLimit,
  }) {
    return _client.apiCall(_token, 'createChatInviteLink', {
      'chat_id': chatId,
      'expire_date': expireDate,
      'member_limit': memberLimit,
    });
  }

  Future<ChatInviteLink> editChatInviteLink(
    ChatID chatId,
    String inviteLink, {
    int? expireDate,
    int? memberLimit,
  }) {
    return _client.apiCall(_token, 'editChatInviteLink', {
      'chat_id': chatId,
      'invite_link': inviteLink,
      'expire_date': expireDate,
      'member_limit': memberLimit,
    });
  }

  Future<ChatInviteLink> revokeChatInviteLink(
    ChatID chatId,
    String inviteLink,
  ) {
    return _client.apiCall(_token, 'revokeChatInviteLink', {
      'chat_id': chatId,
      'invite_link': inviteLink,
    });
  }

  Future<bool> logOut() => _client.apiCall(_token, 'logOut');

  Future<bool> close() => _client.apiCall(_token, 'close');

  Future<Uint8List> download(String path) {
    return _client.apiDownload(_token, path);
  }
}
