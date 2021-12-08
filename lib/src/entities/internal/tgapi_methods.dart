import 'dart:typed_data';

import '../../../dart_telegram_bot.dart';
import '../../../telegram_entities.dart';
import 'tgapi_client.dart';

mixin TGAPIMethods {
  final _client = TGAPIClient();

  late String _token;

  /// Close the http client
  void closeClient() => _client.close();

  /// Setup token to be used for API calls
  set token(String token) => _token = token;

  /// A simple method for testing your bot's auth token.
  ///
  /// Requires no parameters.
  ///
  /// Returns basic information about the bot in form of a User object.
  Future<User> getMe() => _client.apiCall(_token, 'getMe');

  /// Use this method to receive incoming updates using long polling.
  ///
  /// An List of [Update] objects is returned.
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

  /// Use this method to send text messages.
  ///
  /// The sent [Message] is returned.
  Future<Message> sendMessage(
    ChatID chatId,
    String text, {
    ParseMode? parseMode,
    List<MessageEntity>? entities,
    bool? disableWebPagePreview,
    bool? disableNotification,
    int? replyToMessageId,
    bool? allowSendingWithoutReply,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'sendMessage', {
      'chat_id': chatId,
      'text': text,
      'parse_mode': parseMode,
      'entities': entities,
      'disable_notification': disableNotification,
      'disable_web_page_preview': disableWebPagePreview,
      'reply_to_message_id': replyToMessageId,
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup
    });
  }

  /// Use this method to copy messages of any kind.
  ///
  /// The method is analogous to the method forwardMessage,
  /// but the copied message doesn't have a link to the original message.
  ///
  /// Returns the [MessageId] of the sent message on success.
  Future<MessageId> copyMessage(
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

  /// Use this method to send photos.
  ///
  /// On success, the sent [Message] is returned.
  Future<Message> sendPhoto(
    ChatID chatId,
    HttpFile photo, {
    String? caption,
    ParseMode? parseMode,
    List<MessageEntity>? captionEntities,
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
      'caption_entities': captionEntities,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageId,
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup
    });
  }

  /// Use this method to send audio files,
  /// if you want Telegram clients to display them in the music player.
  ///
  /// Your audio must be in the .MP3 or .M4A format.
  ///
  /// On success, the sent [Message] is returned.
  ///
  /// Bots can currently send audio files of up to 50 MB in size,
  /// this limit may be changed in the future.
  ///
  /// For sending voice messages, use the [sendVoice] method instead.
  Future<Message> sendAudio(
    ChatID chatId,
    HttpFile audio, {
    String? caption,
    ParseMode? parseMode,
    List<MessageEntity>? captionEntities,
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
      'caption_entities': captionEntities,
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

  /// Use this method to send general files.
  ///
  /// On success, the sent [Message] is returned.
  ///
  /// Bots can currently send files of any type of up to 50 MB in size,
  /// this limit may be changed in the future.
  Future<Message> sendDocument(
    ChatID chatId,
    HttpFile document, {
    HttpFile? thumb,
    String? caption,
    ParseMode? parseMode,
    List<MessageEntity>? captionEntities,
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
      'caption_entities': captionEntities,
      'thumb': thumb,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageId,
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup,
      'disable_content_type_detection': disableContentTypeDetection,
    });
  }

  /// Use this method to send video files,
  /// Telegram clients support mp4 videos
  /// (other formats may be sent as Document).
  ///
  /// On success, the sent [Message] is returned.
  ///
  /// Bots can currently send video files of up to 50 MB in size,
  /// this limit may be changed in the future.
  Future<Message> sendVideo(
    ChatID chatId,
    HttpFile video, {
    int? duration,
    int? width,
    int? height,
    HttpFile? thumb,
    String? caption,
    ParseMode? parseMode,
    List<MessageEntity>? captionEntities,
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
      'caption_entities': captionEntities,
      'supports_streaming': supportsStreaming,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageId,
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup
    });
  }

  /// Use this method to send animation files (GIF or H.264/MPEG-4 AVC video without sound).
  ///
  /// On success, the sent [Message] is returned.
  ///
  /// Bots can currently send animation files of up to 50 MB in size,
  /// this limit may be changed in the future.
  Future<Message> sendAnimation(
    ChatID chatId,
    HttpFile animation, {
    int? duration,
    int? width,
    int? height,
    HttpFile? thumb,
    String? caption,
    ParseMode? parseMode,
    List<MessageEntity>? captionEntities,
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
      'caption_entities': captionEntities,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageId,
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup
    });
  }

  /// Use this method to send audio files,
  /// if you want Telegram clients to display
  /// the file as a playable voice message.
  ///
  /// For this to work, your audio must be in an .OGG file encoded with OPUS
  /// (other formats may be sent as Audio or Document).
  ///
  /// On success, the sent [Message] is returned.
  ///
  /// Bots can currently send voice messages of up to 50 MB in size,
  /// this limit may be changed in the future.
  Future<Message> sendVoice(
    ChatID chatId,
    HttpFile voice, {
    String? caption,
    ParseMode? parseMode,
    List<MessageEntity>? captionEntities,
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
      'caption_entities': captionEntities,
      'duration': duration,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageId,
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup
    });
  }

  /// Use this method to send video messages.
  ///
  /// On success, the sent [Message] is returned.
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
      'length': length,
      'disable_notification': disableNotification,
      'reply_to_message_id': replyToMessageId,
      'allow_sending_without_reply': allowSendingWithoutReply,
      'reply_markup': replyMarkup
    });
  }

  /// Use this method to send a group of photos,
  /// videos,documents or audios as an album.
  ///
  /// Documents and audio files can be only grouped
  /// in an album with messages of the same type.
  ///
  /// On success, an list of Messages that were sent is returned.
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

  /// Use this method to send point on the map.
  ///
  /// On success, the sent [Message] is returned.
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

  /// Use this method to edit live location messages.
  ///
  /// A location can be edited until its live_period expires or editing is
  /// explicitly disabled by a call to stopMessageLiveLocation.
  ///
  /// On success, the edited [Message] is returned.
  Future<Message> editMessageLiveLocation(
    double latitude,
    double longitude, {
    ChatID? chatId,
    int? messageId,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'editMessageLiveLocation', {
      'chat_id': chatId,
      'message_id': messageId,
      'latitude': latitude,
      'longitude': longitude,
      'reply_markup': replyMarkup
    });
  }

  /// Use this method to edit live location messages.
  ///
  /// A location can be edited until its live_period expires or editing is
  /// explicitly disabled by a call to stopMessageLiveLocation.
  ///
  /// On success, true is returned.
  Future<bool> editMessageLiveLocationInline(
    double latitude,
    double longitude, {
    String? inlineMessageId,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'editMessageLiveLocation', {
      'inline_message_id': inlineMessageId,
      'latitude': latitude,
      'longitude': longitude,
      'reply_markup': replyMarkup
    });
  }

  /// Use this method to stop updating a live
  /// location message before live_period expires.
  ///
  /// On success, the sent [Message] is returned.
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

  /// Use this method to send information about a venue.
  ///
  /// On success, the sent [Message] is returned.
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

  /// Use this method to send phone contacts.
  ///
  /// On success, the sent [Message] is returned.
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

  /// Use this method to send a native poll.
  ///
  /// On success, the sent [Message] is returned.
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

  /// Use this method when you need to tell the user that something is happening
  /// on the bot's side.
  ///
  /// The status is set for 5 seconds or less
  /// (when a message arrives from your bot,
  /// Telegram clients clear its typing status).
  ///
  /// Returns true on success.
  Future<bool> sendChatAction(ChatID chatId, ChatAction action) {
    return _client.apiCall(
      _token,
      'sendChatAction',
      {'chat_id': chatId, 'action': action},
    );
  }

  /// Use this method to get a list of profile pictures for a user.
  ///
  /// Returns a [UserProfilePhotos] object.
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

  /// Use this method to get basic info about
  /// a file and prepare it for downloading.
  ///
  /// For the moment, bots can download files of up to 20MB in size.
  ///
  /// On success, a [File] object is returned.
  /// The file can then be downloaded using [download] method.
  ///
  /// It is guaranteed that the link will be valid for at least 1 hour.
  ///
  /// When the link expires, a new one can
  /// be requested by calling getFile again.
  Future<File> getFile(String fileId) {
    return _client.apiCall(_token, 'getFile', {'file_id': fileId});
  }

  /// Use this method to ban a user in a group, a supergroup or a channel.
  ///
  /// In the case of supergroups and channels, the user will not be able to
  /// return to the chat on their own using invite
  /// links, etc., unless unbanned first.
  ///
  /// The bot must be an administrator in the chat for this to work and must
  /// have the appropriate admin rights.
  ///
  /// Returns true on success.
  Future<bool> banChatMember(
    ChatID chatId,
    int userId, {
    int? untilDate,
    bool? revokeMessages,
  }) {
    return _client.apiCall(_token, 'banChatMember', {
      'chat_id': chatId,
      'user_id': userId,
      'until_date': untilDate,
      'revoke_messages': revokeMessages,
    });
  }

  @Deprecated('Use banChatMember instead')
  Future<bool> kickChatMember(
    ChatID chatId,
    int userId, {
    int? untilDate,
    bool? revokeMessages,
  }) {
    return banChatMember(
      chatId,
      userId,
      untilDate: untilDate,
      revokeMessages: revokeMessages,
    );
  }

  /// Use this method to unban a previously
  /// kicked user in a supergroup or channel.
  /// The user will not return to the group or channel automatically,
  /// but will be able to join via link, etc.
  ///
  /// The bot must be an administrator for this to work.
  /// By default, this method guarantees that after the call the user is not
  /// a member of the chat, but will be able to join it.
  ///
  /// So if the user is a member of the chat
  /// they will also be removed from the chat.
  /// If you don't want this, use the parameter [onlyIfBanned].
  ///
  /// Returns true on success.
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

  /// Use this method to restrict a user in a supergroup.
  /// The bot must be an administrator in the supergroup for this to work and
  /// must have the appropriate admin rights.
  ///
  /// Pass True for all permissions to lift restrictions from a user.
  ///
  /// Returns True on success.
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

  /// Use this method to promote or demote a user in a supergroup or a channel.
  ///
  /// The bot must be an administrator in the chat for this to work and
  /// must have the appropriate admin rights.
  ///
  /// Pass False for all boolean parameters to demote a user.
  ///
  /// Returns True on success.
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

  /// Use this method to set a custom title for an administrator in a supergroup
  /// promoted by the bot.
  ///
  /// Returns True on success.
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

  /// Use this method to set default chat permissions for all members.
  ///
  /// The bot must be an administrator in the group or a supergroup for this
  /// to work and must have the can_restrict_members admin rights.
  ///
  /// Returns True on success.
  Future<bool> setChatPermissions(ChatID chatId, ChatPermissions permissions) {
    return _client.apiCall(_token, 'setChatPermissions', {
      'chat_id': chatId,
      'permissions': permissions,
    });
  }

  /// Use this method to generate a new primary invite link for a chat;
  /// any previously generated primary link is revoked.
  ///
  /// The bot must be an administrator in the chat for this to work and must
  /// have the appropriate admin rights.
  ///
  /// Returns the new invite link as [String] on success.
  Future<String> exportChatInviteLink(ChatID chatId) {
    return _client.apiCall(_token, 'exportChatInviteLink', {
      'chat_id': chatId,
    });
  }

  /// Use this method to set a new profile photo for the chat.
  ///
  /// Photos can't be changed for private chats.
  ///
  /// The bot must be an administrator in the chat for this to work and must
  /// have the appropriate admin rights.
  ///
  /// Returns True on success.
  Future<bool> setChatPhoto(ChatID chatId, HttpFile photo) {
    return _client.apiCall(_token, 'setChatPhoto', {
      'chat_id': chatId,
      'photo': photo,
    });
  }

  /// Use this method to delete a chat photo.
  /// Photos can't be changed for private chats.
  /// The bot must be an administrator in the chat for this to work and must
  /// have the appropriate admin rights.
  ///
  /// Returns True on success.
  Future<bool> deleteChatPhoto(ChatID chatId) {
    return _client.apiCall(_token, 'deleteChatPhoto', {
      'chat_id': chatId,
    });
  }

  /// Use this method to change the title of a chat.
  /// Titles can't be changed for private chats.
  ///
  /// The bot must be an administrator in the chat for this to work and must
  /// have the appropriate admin rights.
  ///
  /// Returns True on success.
  Future<bool> setChatTitle(ChatID chatId, String title) {
    return _client.apiCall(_token, 'setChatTitle', {
      'chat_id': chatId,
      'title': title,
    });
  }

  /// Use this method to change the description of a group,
  /// a supergroup or a channel.
  ///
  /// The bot must be an administrator in the chat for this to work and must
  /// have the appropriate admin rights.
  ///
  /// Returns True on success.
  Future<bool> setChatDescription(ChatID chatId, String description) {
    return _client.apiCall(_token, 'setChatDescription', {
      'chat_id': chatId,
      'description': description,
    });
  }

  /// Use this method to add a message to the list of pinned messages in a chat.
  ///
  /// If the chat is not a private chat, the bot must be an administrator
  /// in the chat for this to work and must have the 'can_pin_messages'
  /// admin right in a supergroup or
  /// 'can_edit_messages' admin right in a channel.
  ///
  /// Returns True on success.
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

  /// Use this method to remove a message from the list of
  /// pinned messages in a chat.
  ///
  /// If the chat is not a private chat, the bot must be an administrator in
  /// the chat for this to work and must have the 'can_pin_messages'
  /// admin right in a supergroup or
  /// 'can_edit_messages' admin right in a channel.
  ///
  /// Returns True on success.
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

  Future<int> getChatMemberCount(ChatID chatId) {
    return _client.apiCall(_token, 'getChatMemberCount', {
      'chat_id': chatId,
    });
  }

  @Deprecated('Use getChatMemberCount instead')
  Future<int> getChatMembersCount(ChatID chatId) {
    return getChatMemberCount(chatId);
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

  Future<bool> setMyCommands(
    List<BotCommand> botCommands, {
    BotCommandScope? scope,
    String? languageCode,
  }) {
    return _client.apiCall(_token, 'setMyCommands', {
      'commands': botCommands,
      'scope': scope,
      'language_code': languageCode,
    });
  }

  Future<bool> deleteMyCommands({
    BotCommandScope? scope,
    String? languageCode,
  }) {
    return _client.apiCall(_token, 'deleteMyCommands', {
      'scope': scope,
      'language_code': languageCode,
    });
  }

  Future<List<BotCommand>> getMyCommands({
    BotCommandScope? scope,
    String? languageCode,
  }) {
    return _client.apiCall(_token, 'getMyCommands', {
      'scope': scope,
      'language_code': languageCode,
    });
  }

  Future<Message> editMessageText(
    String text, {
    ChatID? chatId,
    int? messageId,
    String? inlineMessageId,
    ParseMode? parseMode,
    List<MessageEntity>? entities,
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
      'entities': entities,
      'disable_web_page_preview': disableWebPagePreview,
      'reply_markup': replyMarkup
    });
  }

  Future<Message> editMessageCaption({
    ChatID? chatId,
    int? messageId,
    String? inlineMessageId,
    String? caption,
    ParseMode? parseMode,
    List<MessageEntity>? captionEntities,
    ReplyMarkup? replyMarkup,
  }) {
    if (inlineMessageId == null && (chatId == null || messageId == null)) {
      throw MalformedAPICallException(
        'If inlineMessageId is null then chatId and messageId must be defined',
      );
    }

    return _client.apiCall(_token, 'editMessageCaption', {
      'chat_id': chatId,
      'message_id': messageId,
      'inline_message_id': inlineMessageId,
      'caption': caption,
      'parse_mode': parseMode,
      'caption_entities': captionEntities,
      'reply_markup': replyMarkup
    });
  }

  /// Use this method to send an animated
  /// emoji that will display a random value.
  ///
  /// On success, the sent [Message] is returned.
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

  /// Use this method to create an additional invite link for a chat.
  /// The bot must be an administrator in the chat for this to work and
  /// must have the appropriate admin rights.
  ///
  /// The link can be revoked using the method [revokeChatInviteLink].
  ///
  /// Returns the new invite link as [ChatInviteLink] object.
  Future<ChatInviteLink> createChatInviteLink(
    ChatID chatId, {
    String? name,
    int? expireDate,
    int? memberLimit,
    bool? createsJoinRequest,
  }) {
    return _client.apiCall(_token, 'createChatInviteLink', {
      'chat_id': chatId,
      'name': name,
      'expire_date': expireDate,
      'member_limit': memberLimit,
      'creates_join_request': createsJoinRequest,
    });
  }

  /// Use this method to edit a non-primary invite link created by the bot.
  ///
  /// The bot must be an administrator in the chat for this to work and must
  /// have the appropriate admin rights.
  ///
  /// Returns the edited invite link as a [ChatInviteLink] object.
  Future<ChatInviteLink> editChatInviteLink(
    ChatID chatId,
    String inviteLink, {
    String? name,
    int? expireDate,
    int? memberLimit,
    String? createsJoinRequest,
  }) {
    return _client.apiCall(_token, 'editChatInviteLink', {
      'chat_id': chatId,
      'invite_link': inviteLink,
      'name': name,
      'expire_date': expireDate,
      'member_limit': memberLimit,
      'creates_join_request': createsJoinRequest,
    });
  }

  /// Use this method to revoke an invite link created by the bot.
  ///
  /// If the primary link is revoked, a new link is automatically generated.
  ///
  /// The bot must be an administrator in the chat for this to work and
  /// must have the appropriate admin rights.
  ///
  /// Returns the revoked invite link as [ChatInviteLink] object.
  Future<ChatInviteLink> revokeChatInviteLink(
    ChatID chatId,
    String inviteLink,
  ) {
    return _client.apiCall(_token, 'revokeChatInviteLink', {
      'chat_id': chatId,
      'invite_link': inviteLink,
    });
  }

  /// Use this method to approve a chat join request.
  ///
  /// The bot must be an administrator in the chat for this to work and
  /// must have the can_invite_users administrator right.
  ///
  /// Returns True on success.
  Future<bool> approveChatJoinRequest(
    ChatID chatId,
    int userId,
  ) {
    return _client.apiCall(_token, 'approveChatJoinRequest', {
      'chat_id': chatId,
      'user_id': userId,
    });
  }

  /// Use this method to decline a chat join request.
  ///
  /// The bot must be an administrator in the chat for this to work and
  /// must have the can_invite_users administrator right.
  ///
  /// Returns True on success.
  Future<bool> declineChatJoinRequest(
    ChatID chatId,
    int userId,
  ) {
    return _client.apiCall(_token, 'declineChatJoinRequest', {
      'chat_id': chatId,
      'user_id': userId,
    });
  }

  /// Use this method to ban a channel chat in a supergroup or a channel.
  ///
  /// The owner of the chat will not be able to send messages and
  /// join live streams on behalf of the chat, unless it is unbanned first.
  ///
  /// The bot must be an administrator in the supergroup or channel
  /// for this to work and must have the appropriate administrator rights.
  ///
  /// Returns True on success.
  Future<bool> banChatSenderChat(
    ChatID chatId,
    int senderChatId,
    int? untilDate,
  ) {
    return _client.apiCall(_token, 'banChatSenderChat', {
      'chat_id': chatId,
      'sender_chat_id': senderChatId,
      'until_date': untilDate
    });
  }

  /// Use this method to unban a previously banned channel chat
  /// in a supergroup or channel.
  ///
  /// The bot must be an administrator for this to work and
  /// must have the appropriate administrator rights.
  ///
  /// Returns True on success.
  Future<bool> unbanChatSenderChat(
    ChatID chatId,
    int senderChatId,
  ) {
    return _client.apiCall(_token, 'unbanChatSenderChat', {
      'chat_id': chatId,
      'sender_chat_id': senderChatId,
    });
  }

  Future<bool> logOut() => _client.apiCall(_token, 'logOut');

  Future<bool> close() => _client.apiCall(_token, 'close');

  Future<bool> deleteWebhook({bool? dropPendingUpdates}) {
    return _client.apiCall(_token, 'deleteWebhook', {
      'drop_pending_updates': dropPendingUpdates,
    });
  }

  Future<Uint8List> download(String path) {
    return _client.apiDownload(_token, path);
  }
}
