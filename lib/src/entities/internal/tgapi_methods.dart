import 'dart:typed_data';

import '../../../telegram_entities.dart';
import 'tgapi_client.dart';

/// Telegram Methods
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
  /// Returns basic information about the bot in form of a [User] object.
  Future<User> getMe() => _client.apiCall(_token, 'getMe');

  /// Use this method to receive incoming updates using long polling.
  ///
  /// An array of [Update] objects is returned.
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
  /// On success, the sent [Message] is returned.
  Future<Message> sendMessage(
    ChatID chatId,
    String text, {
    String? businessConnectionId,
    int? messageThreadId,
    ParseMode? parseMode,
    List<MessageEntity>? entities,
    LinkPreviewOptions? linkPreviewOptions,
    bool? disableNotification,
    bool? protectContent,
    String? messageEffectId,
    ReplyParameters? replyParameters,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'sendMessage', {
      'business_connection_id': businessConnectionId,
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'text': text,
      'parse_mode': parseMode,
      'entities': entities,
      'link_preview_options': linkPreviewOptions,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'message_effect_id': messageEffectId,
      'reply_parameters': replyParameters,
      'reply_markup': replyMarkup,
    });
  }

  /// Use this method to forward messages of any kind.
  /// Service messages can't be forwarded.
  ///
  /// On success, the sent [Message] is returned.
  Future<Message> forwardMessage(
    ChatID chatId,
    ChatID fromChatId,
    int messageId, {
    int? messageThreadId,
    bool? disableNotification,
    bool? protectContent,
  }) {
    return _client.apiCall(_token, 'forwardMessage', {
      'chat_id': chatId,
      'from_chat_id': fromChatId,
      'message_id': messageId,
      'message_thread_id': messageThreadId,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
    });
  }

  /// Use this method to forward multiple messages of any kind.
  ///
  /// If some of the specified messages can't be found or forwarded,
  /// they are skipped.
  ///
  /// Service messages and messages with protected content can't be forwarded.
  ///
  /// Album grouping is kept for forwarded messages.
  ///
  /// On success, an array of MessageId of the sent messages is returned.
  Future<List<MessageId>> forwardMessages(
    ChatID chatId,
    ChatID fromChatId,
    List<int> messageIds, {
    int? messageThreadId,
    bool? disableNotification,
    bool? protectContent,
  }) {
    return _client.apiCall(_token, 'forwardMessages', {
      'chat_id': chatId,
      'from_chat_id': fromChatId,
      'message_ids': messageIds,
      'message_thread_id': messageThreadId,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
    });
  }

  /// Use this method to copy messages of any kind.
  ///
  /// Service messages, paid media messages, giveaway messages,
  /// giveaway winners messages, and invoice messages can't be copied.
  ///
  /// A quiz poll can be copied only if the value of the
  /// field correct_option_id is known to the bot.
  ///
  /// The method is analogous to the method [forwardMessage],
  /// but the copied message doesn't have a link to the original message.
  ///
  /// Returns the [MessageId] of the sent message on success.
  Future<MessageId> copyMessage(
    ChatID chatId,
    ChatID fromChatId,
    int messageId, {
    int? messageThreadId,
    String? caption,
    ParseMode? parseMode,
    List<MessageEntity>? captionEntities,
    bool? showCaptionAboveMedia,
    bool? disableNotification,
    bool? protectContent,
    ReplyParameters? replyParameters,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'copyMessage', {
      'chat_id': chatId,
      'from_chat_id': fromChatId,
      'message_id': messageId,
      'message_thread_id': messageThreadId,
      'caption': caption,
      'parse_mode': parseMode,
      'caption_entities': captionEntities,
      'show_caption_above_media': showCaptionAboveMedia,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'reply_parameters': replyParameters,
      'reply_markup': replyMarkup,
    });
  }

  /// Use this method to copy messages of any kind.
  ///
  /// If some of the specified messages can't be found or copied,
  /// they are skipped.
  ///
  /// Service messages, paid media messages, giveaway messages,
  /// giveaway winners messages and invoice messages can't be copied.
  ///
  /// A quiz poll can be copied only if the value of the field
  /// correct_option_id is known to the bot.
  ///
  /// The method is analogous to the method forwardMessages,
  /// but the copied messages don't have a link to the original message.
  ///
  /// Album grouping is kept for copied messages.
  ///
  /// On success, an array of MessageId of the sent messages is returned.
  Future<List<MessageId>> copyMessages(
    ChatID chatId,
    ChatID fromChatId,
    List<int> messageIds, {
    int? messageThreadId,
    bool? disableNotification,
    bool? protectContent,
    bool? removeCaption,
  }) {
    return _client.apiCall(_token, 'copyMessages', {
      'chat_id': chatId,
      'from_chat_id': fromChatId,
      'message_ids': messageIds,
      'message_thread_id': messageThreadId,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'remove_caption': removeCaption,
    });
  }

  /// Use this method to send photos.
  ///
  /// On success, the sent [Message] is returned.
  Future<Message> sendPhoto(
    ChatID chatId,
    HttpFile photo, {
    String? businessConnectionId,
    int? messageThreadId,
    String? caption,
    ParseMode? parseMode,
    List<MessageEntity>? captionEntities,
    bool? showCaptionAboveMedia,
    bool? hasSpoiler,
    bool? disableNotification,
    bool? protectContent,
    String? messageEffectId,
    ReplyParameters? replyParameters,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'sendPhoto', {
      'business_connection_id': businessConnectionId,
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'photo': photo,
      'caption': caption,
      'parse_mode': parseMode,
      'caption_entities': captionEntities,
      'show_caption_above_media': showCaptionAboveMedia,
      'has_spoiler': hasSpoiler,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'message_effect_id': messageEffectId,
      'reply_parameters': replyParameters,
      'reply_markup': replyMarkup,
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
    String? businessConnectionId,
    int? messageThreadId,
    String? caption,
    ParseMode? parseMode,
    List<MessageEntity>? captionEntities,
    int? duration,
    String? performer,
    String? title,
    HttpFile? thumbnail,
    bool? disableNotification,
    bool? protectContent,
    String? messageEffectId,
    ReplyParameters? replyParameters,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'sendAudio', {
      'business_connection_id': businessConnectionId,
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'audio': audio,
      'caption': caption,
      'parse_mode': parseMode,
      'caption_entities': captionEntities,
      'duration': duration,
      'performer': performer,
      'title': title,
      'thumbnail': thumbnail,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'message_effect_id': messageEffectId,
      'reply_parameters': replyParameters,
      'reply_markup': replyMarkup,
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
    String? businessConnectionId,
    int? messageThreadId,
    HttpFile? thumbnail,
    String? caption,
    ParseMode? parseMode,
    List<MessageEntity>? captionEntities,
    bool? disableNotification,
    bool? protectContent,
    String? messageEffectId,
    ReplyParameters? replyParameters,
    ReplyMarkup? replyMarkup,
    bool? disableContentTypeDetection,
  }) {
    return _client.apiCall(_token, 'sendDocument', {
      'business_connection_id': businessConnectionId,
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'document': document,
      'caption': caption,
      'parse_mode': parseMode,
      'caption_entities': captionEntities,
      'thumbnail': thumbnail,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'message_effect_id': messageEffectId,
      'reply_parameters': replyParameters,
      'reply_markup': replyMarkup,
      'disable_content_type_detection': disableContentTypeDetection,
    });
  }

  /// Use this method to send video files,
  /// Telegram clients support mp4 videos
  /// (other formats may be sent as [Document]).
  ///
  /// On success, the sent [Message] is returned.
  ///
  /// Bots can currently send video files of up to 50 MB in size,
  /// this limit may be changed in the future.
  Future<Message> sendVideo(
    ChatID chatId,
    HttpFile video, {
    String? businessConnectionId,
    int? messageThreadId,
    int? duration,
    int? width,
    int? height,
    HttpFile? thumbnail,
    String? caption,
    ParseMode? parseMode,
    List<MessageEntity>? captionEntities,
    bool? showCaptionAboveMedia,
    bool? hasSpoiler,
    bool? supportsStreaming,
    bool? disableNotification,
    bool? protectContent,
    String? messageEffectId,
    ReplyParameters? replyParameters,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'sendVideo', {
      'business_connection_id': businessConnectionId,
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'video': video,
      'duration': duration,
      'width': width,
      'height': height,
      'thumbnail': thumbnail,
      'caption': caption,
      'parse_mode': parseMode,
      'caption_entities': captionEntities,
      'show_caption_above_media': showCaptionAboveMedia,
      'has_spoiler': hasSpoiler,
      'supports_streaming': supportsStreaming,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'message_effect_id': messageEffectId,
      'reply_parameters': replyParameters,
      'reply_markup': replyMarkup,
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
    String? businessConnectionId,
    int? messageThreadId,
    int? duration,
    int? width,
    int? height,
    HttpFile? thumbnail,
    String? caption,
    ParseMode? parseMode,
    List<MessageEntity>? captionEntities,
    bool? showCaptionAboveMedia,
    bool? hasSpoiler,
    bool? disableNotification,
    bool? protectContent,
    String? messageEffectId,
    ReplyParameters? replyParameters,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'sendAnimation', {
      'business_connection_id': businessConnectionId,
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'animation': animation,
      'duration': duration,
      'width': width,
      'height': height,
      'thumbnail': thumbnail,
      'caption': caption,
      'parse_mode': parseMode,
      'caption_entities': captionEntities,
      'show_caption_above_media': showCaptionAboveMedia,
      'has_spoiler': hasSpoiler,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'message_effect_id': messageEffectId,
      'reply_parameters': replyParameters,
      'reply_markup': replyMarkup,
    });
  }

  /// Use this method to send audio files, if you want Telegram clients to
  /// display the file as a playable voice message.
  ///
  /// For this to work, your audio must be in an .OGG file encoded with OPUS,
  /// or in .MP3 format, or in .M4A format
  /// (other formats may be sent as [Audio] or [Document]).
  ///
  /// On success, the sent [Message] is returned.
  ///
  /// Bots can currently send voice messages of up to 50 MB in size,
  /// this limit may be changed in the future.
  Future<Message> sendVoice(
    ChatID chatId,
    HttpFile voice, {
    String? businessConnectionId,
    int? messageThreadId,
    String? caption,
    ParseMode? parseMode,
    List<MessageEntity>? captionEntities,
    int? duration,
    bool? disableNotification,
    bool? protectContent,
    String? messageEffectId,
    ReplyParameters? replyParameters,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'sendVoice', {
      'business_connection_id': businessConnectionId,
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'voice': voice,
      'caption': caption,
      'parse_mode': parseMode,
      'caption_entities': captionEntities,
      'duration': duration,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'message_effect_id': messageEffectId,
      'reply_parameters': replyParameters,
      'reply_markup': replyMarkup,
    });
  }

  /// Use this method to send video messages.
  ///
  /// On success, the sent [Message] is returned.
  Future<Message> sendVideoNote(
    ChatID chatId,
    HttpFile videoNote, {
    String? businessConnectionId,
    int? messageThreadId,
    int? duration,
    int? length,
    HttpFile? thumbnail,
    bool? disableNotification,
    bool? protectContent,
    String? messageEffectId,
    ReplyParameters? replyParameters,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'sendVideoNote', {
      'business_connection_id': businessConnectionId,
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'video_note': videoNote,
      'duration': duration,
      'length': length,
      'thumbnail': thumbnail,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'message_effect_id': messageEffectId,
      'reply_parameters': replyParameters,
      'reply_markup': replyMarkup,
    });
  }

  /// Use this method to send paid media.
  /// On success, the sent [Message] is returned.
  Future<Message> sendPaidMedia(
    ChatID chatId,
    int starCount,
    List<InputPaidMedia> media, {
    String? businessConnectionId,
    String? payload,
    String? caption,
    ParseMode? parseMode,
    List<MessageEntity>? captionEntities,
    bool? showCaptionAboveMedia,
    bool? disableNotification,
    bool? protectContent,
    bool? allowPaidBroadcast,
    ReplyParameters? replyParameters,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'sendPaidMedia', {
      'business_connection_id': businessConnectionId,
      'chat_id': chatId,
      'star_count': starCount,
      'media': media,
      'payload': payload,
      'caption': caption,
      'parse_mode': parseMode,
      'caption_entities': captionEntities,
      'show_caption_above_media': showCaptionAboveMedia,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'allow_paid_broadcast': allowPaidBroadcast,
      'reply_parameters': replyParameters,
      'reply_markup': replyMarkup,
    });
  }

  /// Use this method to send a group of photos,
  /// videos,documents or audios as an album.
  ///
  /// Documents and audio files can be only grouped
  /// in an album with messages of the same type.
  ///
  /// On success, an array of [Message] that were sent is returned.
  Future<List<Message>> sendMediaGroup(
    ChatID chatId,
    List<InputMedia> media, {
    String? businessConnectionId,
    int? messageThreadId,
    bool? disableNotification,
    bool? protectContent,
    String? messageEffectId,
    ReplyParameters? replyParameters,
  }) {
    return _client.apiCall(_token, 'sendMediaGroup', {
      'business_connection_id': businessConnectionId,
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'media': media,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'message_effect_id': messageEffectId,
      'reply_parameters': replyParameters,
    });
  }

  /// Use this method to send point on the map.
  ///
  /// On success, the sent [Message] is returned.
  Future<Message> sendLocation(
    ChatID chatId,
    double latitude,
    double longitude, {
    String? businessConnectionId,
    int? messageThreadId,
    double? horizontalAccuracy,
    int? livePeriod,
    int? heading,
    int? proximityAlertRadius,
    bool? disableNotification,
    bool? protectContent,
    String? messageEffectId,
    ReplyParameters? replyParameters,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'sendLocation', {
      'business_connection_id': businessConnectionId,
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'latitude': latitude,
      'longitude': longitude,
      'horizontal_accuracy': horizontalAccuracy,
      'live_period': livePeriod,
      'heading': heading,
      'proximity_alert_radius': proximityAlertRadius,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'message_effect_id': messageEffectId,
      'reply_parameters': replyParameters,
      'reply_markup': replyMarkup,
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
    String? businessConnectionId,
    int? messageThreadId,
    String? foursquareId,
    String? foursquareType,
    String? googlePlaceId,
    String? googlePlaceType,
    bool? disableNotification,
    bool? protectContent,
    String? messageEffectId,
    ReplyParameters? replyParameters,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'sendVenue', {
      'business_connection_id': businessConnectionId,
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'latitude': latitude,
      'longitude': longitude,
      'title': title,
      'address': address,
      'foursquare_id': foursquareId,
      'foursquare_type': foursquareType,
      'google_place_id': googlePlaceId,
      'google_place_type': googlePlaceType,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'message_effect_id': messageEffectId,
      'reply_parameters': replyParameters,
      'reply_markup': replyMarkup,
    });
  }

  /// Use this method to send phone contacts.
  ///
  /// On success, the sent [Message] is returned.
  Future<Message> sendContact(
    ChatID chatId,
    String phoneNumber,
    String? firstName, {
    String? businessConnectionId,
    int? messageThreadId,
    String? lastName,
    String? vcard,
    bool? disableNotification,
    bool? protectContent,
    String? messageEffectId,
    ReplyParameters? replyParameters,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'sendContact', {
      'business_connection_id': businessConnectionId,
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'phone_number': phoneNumber,
      'first_name': firstName,
      'last_name': lastName,
      'vcard': vcard,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'message_effect_id': messageEffectId,
      'reply_parameters': replyParameters,
      'reply_markup': replyMarkup,
    });
  }

  /// Use this method to send a native poll.
  ///
  /// On success, the sent [Message] is returned.
  Future<Message> sendPoll(
    ChatID chatId,
    String question,
    List<InputPollOption> options, {
    String? businessConnectionId,
    int? messageThreadId,
    ParseMode? questionParseMode,
    List<MessageEntity>? questionEntities,
    bool? isAnonymous,
    String? type,
    bool? allowsMultipleAnswers,
    int? correctOptionId,
    String? explanation,
    String? explanationParseMode,
    List<MessageEntity>? explanationEntities,
    int? openPeriod,
    int? closeDate,
    bool? isClosed,
    bool? disableNotification,
    bool? protectContent,
    String? messageEffectId,
    ReplyParameters? replyParameters,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'sendPoll', {
      'business_connection_id': businessConnectionId,
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'question': question,
      'question_parse_mode': questionParseMode,
      'question_entities': questionEntities,
      'options': options,
      'is_anonymous': isAnonymous,
      'type': type,
      'allows_multiple_answers': allowsMultipleAnswers,
      'correct_option_id': correctOptionId,
      'explanation': explanation,
      'explanation_parse_mode': explanationParseMode,
      'explanation_entities': explanationEntities,
      'open_period': openPeriod,
      'close_date': closeDate,
      'is_closed': isClosed,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'message_effect_id': messageEffectId,
      'reply_parameters': replyParameters,
      'reply_markup': replyMarkup,
    });
  }

  /// Use this method to send an animated
  /// emoji that will display a random value.
  ///
  /// On success, the sent [Message] is returned.
  Future<Message> sendDice(
    ChatID chatId, {
    String? businessConnectionId,
    int? messageThreadId,
    Emoji? emoji,
    bool? disableNotification,
    bool? protectContent,
    String? messageEffectId,
    ReplyParameters? replyParameters,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'sendDice', {
      'business_connection_id': businessConnectionId,
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'emoji': emoji,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'message_effect_id': messageEffectId,
      'reply_parameters': replyParameters,
      'reply_markup': replyMarkup,
    });
  }

  /// Use this method when you need to tell the user that something is happening
  /// on the bot's side.
  ///
  /// The status is set for 5 seconds or less
  /// (when a message arrives from your bot,
  /// Telegram clients clear its typing status).
  ///
  /// Returns True on success.
  Future<bool> sendChatAction(
    ChatID chatId,
    ChatAction action, {
    String? businessConnectionId,
    int? messageThreadId,
  }) {
    return _client.apiCall(
      _token,
      'sendChatAction',
      {
        'business_connection_id': businessConnectionId,
        'chat_id': chatId,
        'message_thread_id': messageThreadId,
        'action': action,
      },
    );
  }

  /// Use this method to change the chosen reactions on a message.
  ///
  /// Service messages can't be reacted to.
  ///
  /// Automatically forwarded messages from a channel to its discussion group
  /// have the same available reactions as messages in the channel.
  ///
  /// Returns True on success.
  Future<bool> setMessageReaction(
    ChatID chatId,
    int messageId, {
    List<ReactionType>? reaction,
    bool? isBig,
  }) {
    return _client.apiCall(
      _token,
      'setMessageReaction',
      {
        'chat_id': chatId,
        'message_id': messageId,
        'reaction': reaction,
        'is_big': isBig,
      },
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
  /// be requested by calling [getFile] again.
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
  /// Returns True on success.
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
  /// Returns True on success.
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
    bool? useIndependentChatPermissions,
    int? untilDate,
  }) {
    return _client.apiCall(_token, 'restrictChatMember', {
      'chat_id': chatId,
      'user_id': userId,
      'permissions': permissions,
      'use_independent_chat_permissions': useIndependentChatPermissions,
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
    bool? canManageChat,
    bool? canDeleteMessages,
    bool? canManageVideoChats,
    bool? canRestrictMembers,
    bool? canPromoteMembers,
    bool? canChangeInfo,
    bool? canInviteUsers,
    bool? canPostMessages,
    bool? canEditMessages,
    bool? canPinMessages,
    bool? canPostStories,
    bool? canEditStories,
    bool? canDeleteStories,
    bool? canManageTopics,
  }) {
    return _client.apiCall(_token, 'promoteChatMember', {
      'chat_id': chatId,
      'user_id': userId,
      'is_anonymous': isAnonymous,
      'can_manage_chat': canManageChat,
      'can_delete_messages': canDeleteMessages,
      'can_manage_video_chats': canManageVideoChats,
      'can_restrict_members': canRestrictMembers,
      'can_promote_members': canPromoteMembers,
      'can_change_info': canChangeInfo,
      'can_invite_users': canInviteUsers,
      'can_post_messages': canPostMessages,
      'can_edit_messages': canEditMessages,
      'can_pin_messages': canPinMessages,
      'can_post_stories': canPostStories,
      'can_edit_stories': canEditStories,
      'can_delete_stories': canDeleteStories,
      'can_manage_topics': canManageTopics,
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

  /// Use this method to ban a channel chat in a supergroup or a channel.
  ///
  /// Until the chat is unbanned, the owner of the banned chat won't be able to
  /// send messages on behalf of any of their channels.
  ///
  /// The bot must be an administrator in the supergroup or channel
  /// for this to work and must have the appropriate administrator rights.
  ///
  /// Returns True on success.
  Future<bool> banChatSenderChat(
    ChatID chatId,
    int senderChatId,
  ) {
    return _client.apiCall(_token, 'banChatSenderChat', {
      'chat_id': chatId,
      'sender_chat_id': senderChatId,
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

  /// Use this method to set default chat permissions for all members.
  ///
  /// The bot must be an administrator in the group or a supergroup for this
  /// to work and must have the can_restrict_members admin rights.
  ///
  /// Returns True on success.
  Future<bool> setChatPermissions(
    ChatID chatId,
    ChatPermissions permissions, {
    bool? useIndependentChatPermissions,
  }) {
    return _client.apiCall(_token, 'setChatPermissions', {
      'chat_id': chatId,
      'permissions': permissions,
      'use_independent_chat_permissions': useIndependentChatPermissions,
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

  /// Use this method to create an additional invite link for a chat.
  ///
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
  ///
  /// Photos can't be changed for private chats.
  ///
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
  ///
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

  /// Use this method to clear the list of pinned messages in a chat.
  ///
  /// If the chat is not a private chat, the bot must be an administrator in
  /// the chat for this to work and must have the 'can_pin_messages'
  /// administrator right in a supergroup or 'can_edit_messages' administrator
  /// right in a channel.
  ///
  /// Returns True on success.
  Future<bool> unpinAllChatMessages(ChatID chatId) {
    return _client.apiCall(_token, 'unpinAllChatMessages', {
      'chat_id': chatId,
    });
  }

  /// Use this method for your bot to leave a group, supergroup or channel.
  ///
  /// Returns True on success.
  Future<bool> leaveChat(ChatID chatId) {
    return _client.apiCall(_token, 'leaveChat', {
      'chat_id': chatId,
    });
  }

  /// Use this method to get up-to-date information about the chat.
  ///
  /// Returns a [ChatFullInfo] object on success.
  Future<ChatFullInfo> getChat(ChatID chatId) {
    return _client.apiCall(_token, 'getChat', {
      'chat_id': chatId,
    });
  }

  /// Use this method to get a list of administrators in a chat.
  ///
  /// On success, returns an Array of [ChatMember] objects that contains
  /// information about all chat administrators except other bots.
  ///
  /// If the chat is a group or a supergroup and no administrators were
  /// appointed, only the creator will be returned.
  Future<List<ChatMember>> getChatAdministrators(ChatID chatId) {
    return _client.apiCall(_token, 'getChatAdministrators', {
      'chat_id': chatId,
    });
  }

  /// Use this method to get the number of members in a chat.
  ///
  /// Returns [int] on success.
  Future<int> getChatMemberCount(ChatID chatId) {
    return _client.apiCall(_token, 'getChatMemberCount', {
      'chat_id': chatId,
    });
  }

  /// Use this method to get information about a member of a chat.
  ///
  /// Returns a [ChatMember] object on success.
  Future<ChatMember> getChatMember(ChatID chatId, int userId) {
    return _client.apiCall(_token, 'getChatMember', {
      'chat_id': chatId,
      'user_id': userId,
    });
  }

  /// Use this method to set a new group sticker set for a supergroup.
  ///
  /// The bot must be an administrator in the chat for this to work and must
  /// have the appropriate administrator rights.
  ///
  /// Use the field can_set_sticker_set optionally returned in [getChat]
  /// requests to check if the bot can use this method.
  ///
  /// Returns True on success.
  Future<bool> setChatStickerSet(ChatID chatId, String stickerSetName) {
    return _client.apiCall(_token, 'setChatStickerSet', {
      'chat_id': chatId,
      'sticker_set_name': stickerSetName,
    });
  }

  /// Use this method to delete a group sticker set from a supergroup.
  ///
  /// The bot must be an administrator in the chat for this to work and must
  /// have the appropriate administrator rights.
  ///
  /// Use the field can_set_sticker_set optionally returned in [getChat]
  /// requests to check if the bot can use this method.
  ///
  /// Returns True on success.
  Future<bool> deleteChatStickerSet(ChatID chatId) {
    return _client.apiCall(_token, 'deleteChatStickerSet', {
      'chat_id': chatId,
    });
  }

  /// Use this method to get custom emoji stickers, which can be used as a
  /// forum topic icon by any user.
  /// Requires no parameters.
  /// Returns an Array of [Sticker] objects.
  Future<List<Sticker>> getForumTopicIconStickers() {
    return _client.apiCall(_token, 'getForumTopicIconStickers');
  }

  /// Use this method to create a topic in a forum supergroup chat.
  /// The bot must be an administrator in the chat for this to work and
  /// must have the can_manage_topics administrator rights.
  /// Returns information about the created topic as a [ForumTopic] object.
  Future<ForumTopic> createForumTopic(
    ChatID chatId,
    String name, {
    int? iconColor,
    String? iconCustomEmojiId,
  }) {
    return _client.apiCall(_token, 'createForumTopic', {
      'chat_id': chatId,
      'name': name,
      'icon_color': iconColor,
      'icon_custom_emoji_id': iconCustomEmojiId,
    });
  }

  /// Use this method to edit name and icon of a topic in a forum supergroup
  /// chat.
  /// The bot must be an administrator in the chat for this to work and
  /// must have can_manage_topics administrator rights,
  /// unless it is the creator of the topic.
  /// Returns True on success.
  Future<bool> editForumTopic(
    ChatID chatId,
    int messageThreadId, {
    String? name,
    String? iconCustomEmojiId,
  }) {
    return _client.apiCall(_token, 'editForumTopic', {
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'name': name,
      'icon_custom_emoji_id': iconCustomEmojiId,
    });
  }

  /// Use this method to close an open topic in a forum supergroup chat.
  /// The bot must be an administrator in the chat for this to work and must
  /// have the can_manage_topics administrator rights,
  /// unless it is the creator of the topic.
  /// Returns True on success.
  Future<bool> closeForumTopic(
    ChatID chatId,
    int messageThreadId,
  ) {
    return _client.apiCall(_token, 'closeForumTopic', {
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
    });
  }

  /// Use this method to reopen a closed topic in a forum supergroup chat.
  /// The bot must be an administrator in the chat for this to work and must
  /// have the can_manage_topics administrator rights,
  /// unless it is the creator of the topic.
  /// Returns True on success.
  Future<bool> reopenForumTopic(
    ChatID chatId,
    int messageThreadId,
  ) {
    return _client.apiCall(_token, 'reopenForumTopic', {
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
    });
  }

  /// Use this method to delete a forum topic along with all its messages in a
  /// forum supergroup chat.
  /// The bot must be an administrator in the chat for this to work and must
  /// have the can_delete_messages administrator rights.
  /// Returns True on success.
  Future<bool> deleteForumTopic(
    ChatID chatId,
    int messageThreadId,
  ) {
    return _client.apiCall(_token, 'deleteForumTopic', {
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
    });
  }

  /// Use this method to clear the list of pinned messages in a forum topic.
  /// The bot must be an administrator in the chat for this to work and must
  /// have the can_pin_messages administrator right in the supergroup.
  /// Returns True on success.
  Future<bool> unpinAllForumTopicMessages(
    ChatID chatId,
    int messageThreadId,
  ) {
    return _client.apiCall(_token, 'unpinAllForumTopicMessages', {
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
    });
  }

  /// Use this method to edit the name of the 'General' topic in a forum
  /// supergroup chat.
  /// The bot must be an administrator in the chat for this to work and must
  /// have can_manage_topics administrator rights.
  /// Returns True on success.
  Future<bool> editGeneralForumTopic(
    ChatID chatId,
    String name,
  ) {
    return _client.apiCall(_token, 'editGeneralForumTopic', {
      'chat_id': chatId,
      'name': name,
    });
  }

  /// Use this method to close an open 'General' topic in a forum
  /// supergroup chat.
  /// The bot must be an administrator in the chat for this to work and must
  /// have the can_manage_topics administrator rights.
  /// Returns True on success.
  Future<bool> closeGeneralForumTopic(ChatID chatId) {
    return _client.apiCall(_token, 'closeGeneralForumTopic', {
      'chat_id': chatId,
    });
  }

  /// Use this method to reopen a closed 'General' topic in a forum
  /// supergroup chat. The bot must be an administrator in the chat for this
  /// to work and must have the can_manage_topics administrator rights.
  /// The topic will be automatically unhidden if it was hidden.
  /// Returns True on success.
  Future<bool> reopenGeneralForumTopic(ChatID chatId) {
    return _client.apiCall(_token, 'reopenGeneralForumTopic', {
      'chat_id': chatId,
    });
  }

  /// Use this method to hide the 'General' topic in a forum supergroup chat.
  /// The bot must be an administrator in the chat for this to work and must
  /// have the can_manage_topics administrator rights.
  /// The topic will be automatically closed if it was open.
  /// Returns True on success.
  Future<bool> hideGeneralForumTopic(ChatID chatId) {
    return _client.apiCall(_token, 'hideGeneralForumTopic', {
      'chat_id': chatId,
    });
  }

  /// Use this method to unhide the 'General' topic in a forum supergroup chat.
  /// The bot must be an administrator in the chat for this to work and must
  /// have the can_manage_topics administrator rights.
  /// Returns True on success.
  Future<bool> unhideGeneralForumTopic(ChatID chatId) {
    return _client.apiCall(_token, 'unhideGeneralForumTopic', {
      'chat_id': chatId,
    });
  }

  Future<bool> unpinAllGeneralForumTopicMessages(ChatID chatId) {
    return _client.apiCall(_token, 'unpinAllGeneralForumTopicMessages', {
      'chat_id': chatId,
    });
  }

  /// Use this method to send answers to callback queries sent from
  /// inline keyboards.
  ///
  /// The answer will be displayed to the user as a notification at the top of
  /// the chat screen or as an alert.
  ///
  /// On success, True is returned.
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
      'cache_time': cacheTime,
    });
  }

  /// Use this method to get the list of boosts added to a chat by a user.
  /// Requires administrator rights in the chat.
  ///
  /// Returns a [UserChatBoosts] object.
  Future<UserChatBoosts> getUserChatBoosts(
    ChatID chatId,
    int userId,
  ) {
    return _client.apiCall(_token, 'getUserChatBoosts', {
      'chat_id': chatId,
      'user_id': userId,
    });
  }

  /// Use this method to get information about the connection of the bot with a
  /// business account.
  ///
  /// Returns a [BusinessConnection] object.
  Future<UserChatBoosts> getBusinessConnection(String businessConnectionId) {
    return _client.apiCall(_token, 'getBusinessConnection', {
      'business_connection_id': businessConnectionId,
    });
  }

  /// Use this method to change the list of the bot's commands.
  /// See https://core.telegram.org/bots#commands for more details about
  /// bot commands.
  ///
  /// Returns True on success.
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

  /// Use this method to delete the list of the bot's commands for the given
  /// scope and user language.
  ///
  /// After deletion, higher level commands will be shown to affected users.
  ///
  /// Returns True on success.
  Future<bool> deleteMyCommands({
    BotCommandScope? scope,
    String? languageCode,
  }) {
    return _client.apiCall(_token, 'deleteMyCommands', {
      'scope': scope,
      'language_code': languageCode,
    });
  }

  /// Use this method to get the current list of the bot's commands for the
  /// given scope and user language.
  ///
  /// Returns Array of [BotCommand] on success.
  ///
  /// If commands aren't set, an empty list is returned.
  Future<List<BotCommand>> getMyCommands({
    BotCommandScope? scope,
    String? languageCode,
  }) {
    return _client.apiCall(_token, 'getMyCommands', {
      'scope': scope,
      'language_code': languageCode,
    });
  }

  /// Use this method to change the bot's name.
  ///
  /// Returns True on success.
  Future<bool> setMyName({
    String? name,
    String? languageCode,
  }) {
    return _client.apiCall(_token, 'setMyName', {
      'name': name,
      'language_code': languageCode,
    });
  }

  /// Use this method to get the current bot name for the given user language.
  ///
  /// Returns BotName on success.
  Future<BotName> getMyName({
    String? languageCode,
  }) {
    return _client.apiCall(_token, 'getMyName', {
      'language_code': languageCode,
    });
  }

  /// Use this method to change the bot's description, which is shown in the
  /// chat with the bot if the chat is empty.
  ///
  /// Returns True on success.
  Future<bool> setMyDescription({
    String? description,
    String? languageCode,
  }) {
    return _client.apiCall(_token, 'setMyDescription', {
      'description': description,
      'language_code': languageCode,
    });
  }

  /// Use this method to get the current bot description for the given user
  /// language.
  ///
  /// Returns BotDescription on success.
  Future<BotDescription> getMyDescription({
    String? languageCode,
  }) {
    return _client.apiCall(_token, 'getMyDescription', {
      'language_code': languageCode,
    });
  }

  /// Use this method to change the bot's short description,
  /// which is shown on the bot's profile page and is sent together with the
  /// link when users share the bot.
  ///
  /// Returns True on success.
  Future<bool> setMyShortDescription({
    String? shortDescription,
    String? languageCode,
  }) {
    return _client.apiCall(_token, 'setMyShortDescription', {
      'short_description': shortDescription,
      'language_code': languageCode,
    });
  }

  /// Use this method to get the current bot short description for the given
  /// user language.
  ///
  /// Returns BotShortDescription on success.
  Future<BotDescription> getMyShortDescription({
    String? languageCode,
  }) {
    return _client.apiCall(_token, 'getMyShortDescription', {
      'language_code': languageCode,
    });
  }

  /// Use this method to change the bot's menu button in a private chat,
  /// or the default menu button.
  ///
  /// Returns True on success.
  Future<bool> setChatMenuButton({
    ChatID? chatId,
    MenuButton? menuButton,
  }) {
    return _client.apiCall(_token, 'setChatMenuButton', {
      'chat_id': chatId,
      'menu_button': menuButton,
    });
  }

  /// Use this method to get the current value of the bot's menu button in
  /// a private chat, or the default menu button.
  ///
  /// Returns [MenuButton] on success.
  Future<MenuButton> getChatMenuButton({
    ChatID? chatId,
  }) {
    return _client.apiCall(_token, 'getChatMenuButton', {
      'chat_id': chatId,
    });
  }

  /// Use this method to change the default administrator rights requested by
  /// the bot when it's added as an administrator to groups or channels.
  ///
  /// These rights will be suggested to users, but they are are free to modify
  /// the list before adding the bot.
  ///
  /// Returns True on success.
  Future<bool> setMyDefaultAdministratorRights({
    ChatAdministratorRights? rights,
    bool? forChannels,
  }) {
    return _client.apiCall(_token, 'setMyDefaultAdministratorRights', {
      'rights': rights,
      'for_channels': forChannels,
    });
  }

  /// Use this method to get the current default administrator rights
  /// of the bot.
  ///
  /// Returns [ChatAdministratorRights] on success.
  Future<ChatAdministratorRights> getMyDefaultAdministratorRights({
    bool? forChannels,
  }) {
    return _client.apiCall(_token, 'getMyDefaultAdministratorRights', {
      'for_channels': forChannels,
    });
  }

  /// Use this method to edit text and [game](https://core.telegram.org/bots/api#games)
  /// messages.
  ///
  /// On success, the edited [Message] is returned.
  ///
  /// Note that business messages that were not sent by the bot and do no
  /// contain an inline keyboard can only be edited within **48 hours** from the
  /// time they were sent.
  Future<Message> editMessageText(
    ChatID chatId,
    int messageId,
    String text, {
    String? businessConnectionId,
    ParseMode? parseMode,
    List<MessageEntity>? entities,
    LinkPreviewOptions? linkPreviewOptions,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'editMessageText', {
      'business_connection_id': businessConnectionId,
      'chat_id': chatId,
      'message_id': messageId,
      'text': text,
      'parse_mode': parseMode,
      'entities': entities,
      'link_preview_options': linkPreviewOptions,
      'reply_markup': replyMarkup,
    });
  }

  /// Use this method to edit text and game messages.
  ///
  /// On success, `true` is returned.
  ///
  /// Note that business messages that were not sent by the bot and do no
  /// contain an inline keyboard can only be edited within **48 hours** from the
  /// time they were sent.
  Future<bool> editMessageTextInline(
    String text,
    String inlineMessageId, {
    String? businessConnectionId,
    ParseMode? parseMode,
    List<MessageEntity>? entities,
    LinkPreviewOptions? linkPreviewOptions,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'editMessageText', {
      'business_connection_id': businessConnectionId,
      'inline_message_id': inlineMessageId,
      'text': text,
      'parse_mode': parseMode,
      'entities': entities,
      'link_preview_options': linkPreviewOptions,
      'reply_markup': replyMarkup,
    });
  }

  /// Use this method to edit captions of messages.
  ///
  /// On success, the edited [Message] is returned.
  ///
  /// Note that business messages that were not sent by the bot and do no
  /// contain an inline keyboard can only be edited within **48 hours** from the
  /// time they were sent.
  Future<Message> editMessageCaption(
    ChatID chatId,
    int messageId, {
    String? businessConnectionId,
    String? caption,
    ParseMode? parseMode,
    List<MessageEntity>? captionEntities,
    bool? showCaptionAboveMedia,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'editMessageCaption', {
      'business_connection_id': businessConnectionId,
      'chat_id': chatId,
      'message_id': messageId,
      'caption': caption,
      'parse_mode': parseMode,
      'caption_entities': captionEntities,
      'show_caption_above_media': showCaptionAboveMedia,
      'reply_markup': replyMarkup,
    });
  }

  /// Use this method to edit captions of messages.
  ///
  /// On success, `true` is returned.
  ///
  /// Note that business messages that were not sent by the bot and do no
  /// contain an inline keyboard can only be edited within **48 hours** from the
  /// time they were sent.
  Future<bool> editMessageCaptionInline(
    String inlineMessageId, {
    String? businessConnectionId,
    String? caption,
    ParseMode? parseMode,
    List<MessageEntity>? captionEntities,
    bool? showCaptionAboveMedia,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'editMessageCaption', {
      'business_connection_id': businessConnectionId,
      'inline_message_id': inlineMessageId,
      'caption': caption,
      'parse_mode': parseMode,
      'caption_entities': captionEntities,
      'show_caption_above_media': showCaptionAboveMedia,
      'reply_markup': replyMarkup,
    });
  }

  /// Use this method to edit animation, audio, document, photo,
  /// or video messages.
  ///
  /// If a message is part of a message album, then it can be edited only to
  /// an audio for audio albums, only to a document for document albums and to
  /// a photo or a video otherwise.
  ///
  /// On success, the edited [Message] is returned.
  ///
  /// Note that business messages that were not sent by the bot and do no
  /// contain an inline keyboard can only be edited within **48 hours** from the
  /// time they were sent.
  Future<Message> editMessageMedia(
    ChatID chatId,
    int messageId,
    InputMedia media, {
    String? businessConnectionId,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'editMessageMedia', {
      'business_connection_id': businessConnectionId,
      'chat_id': chatId,
      'message_id': messageId,
      'media': media,
      'reply_markup': replyMarkup,
    });
  }

  /// Use this method to edit animation, audio, document, photo,
  /// or video messages.
  ///
  /// If a message is part of a message album, then it can be edited only to
  /// an audio for audio albums, only to a document for document albums and to
  /// a photo or a video otherwise.
  ///
  /// When an inline message is edited, a new file can't be uploaded;
  /// use a previously uploaded file via its `file_id` or specify a URL.
  ///
  /// On success, `true` is returned.
  ///
  /// Note that business messages that were not sent by the bot and do no
  /// contain an inline keyboard can only be edited within **48 hours** from the
  /// time they were sent.
  Future<bool> editMessageMediaInline(
    String inlineMessageId,
    InputMedia media, {
    String? businessConnectionId,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'editMessageMedia', {
      'business_connection_id': businessConnectionId,
      'inline_message_id': inlineMessageId,
      'media': media,
      'reply_markup': replyMarkup,
    });
  }

  /// Use this method to edit live location messages.
  ///
  /// A location can be edited until its `live_period` expires or editing is
  /// explicitly disabled by a call to [stopMessageLiveLocation].
  ///
  /// On success, [Message] is returned.
  Future<dynamic> editMessageLiveLocation(
    ChatID chatId,
    int messageId,
    double latitude,
    double longitude, {
    String? businessConnectionId,
    int? livePeriod,
    double? horizontalAccuracy,
    int? heading,
    int? proximityAlertRadius,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'editMessageLiveLocation', {
      'business_connection_id': businessConnectionId,
      'chat_id': chatId,
      'message_id': messageId,
      'latitude': latitude,
      'longitude': longitude,
      'live_period': livePeriod,
      'horizontal_accuracy': horizontalAccuracy,
      'heading': heading,
      'proximity_alert_radius': proximityAlertRadius,
      'reply_markup': replyMarkup,
    });
  }

  /// Use this method to edit live location messages.
  ///
  /// A location can be edited until its `live_period` expires or editing is
  /// explicitly disabled by a call to [stopMessageLiveLocation].
  ///
  /// On success, `true` is returned.
  Future<bool> editMessageLiveLocationInline(
    String inlineMessageId,
    double latitude,
    double longitude, {
    String? businessConnectionId,
    double? horizontalAccuracy,
    int? heading,
    int? proximityAlertRadius,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'editMessageLiveLocation', {
      'business_connection_id': businessConnectionId,
      'inline_message_id': inlineMessageId,
      'latitude': latitude,
      'longitude': longitude,
      'horizontal_accuracy': horizontalAccuracy,
      'heading': heading,
      'proximity_alert_radius': proximityAlertRadius,
      'reply_markup': replyMarkup,
    });
  }

  /// Use this method to stop updating a live
  /// location message before `live_period` expires.
  ///
  /// On success, the edited [Message] is returned.
  Future<Message> stopMessageLiveLocation(
    ChatID chatId,
    int messageId, {
    String? businessConnectionId,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'stopMessageLiveLocation', {
      'business_connection_id': businessConnectionId,
      'chat_id': chatId,
      'message_id': messageId,
      'reply_markup': replyMarkup,
    });
  }

  /// Use this method to stop updating a live
  /// location message before `live_period` expires.
  ///
  /// On success, `true` is returned.
  Future<bool> stopMessageLiveLocationInline(
    String inlineMessageId, {
    String? businessConnectionId,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'stopMessageLiveLocation', {
      'business_connection_id': businessConnectionId,
      'inline_message_id': inlineMessageId,
      'reply_markup': replyMarkup,
    });
  }

  /// Use this method to edit only the reply markup of messages.
  ///
  /// On success, the edited [Message] is returned.
  ///
  /// Note that business messages that were not sent by the bot and do no
  /// contain an inline keyboard can only be edited within **48 hours** from the
  /// time they were sent.
  Future<Message> editMessageReplyMarkup(
    ChatID chatId,
    int messageId, {
    String? businessConnectionId,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'editMessageReplyMarkup', {
      'business_connection_id': businessConnectionId,
      'chat_id': chatId,
      'message_id': messageId,
      'reply_markup': replyMarkup,
    });
  }

  /// Use this method to edit only the reply markup of messages.
  ///
  /// On success, True is returned.
  ///
  /// Note that business messages that were not sent by the bot and do no
  /// contain an inline keyboard can only be edited within **48 hours** from the
  /// time they were sent.
  Future<bool> editMessageReplyMarkupInline(
    String inlineMessageId, {
    String? businessConnectionId,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'editMessageReplyMarkup', {
      'business_connection_id': businessConnectionId,
      'inline_message_id': inlineMessageId,
      'reply_markup': replyMarkup,
    });
  }

  /// Use this method to stop a poll which was sent by the bot.
  ///
  /// On success, the stopped [Poll] is returned.
  Future<Poll> stopPoll(
    ChatID chatId,
    int messageId, {
    String? businessConnectionId,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'stopPoll', {
      'business_connection_id': businessConnectionId,
      'chat_id': chatId,
      'message_id': messageId,
      'reply_markup': replyMarkup,
    });
  }

  /// Use this method to delete a message, including service messages,
  /// with the following limitations:
  /// - A message can only be deleted if it was sent less than 48 hours ago.
  /// - A dice message in a private chat can only be deleted if it was sent
  /// more than 24 hours ago.
  /// - Bots can delete outgoing messages in private chats, groups,
  /// and supergroups.
  /// - Bots can delete incoming messages in private chats.
  /// - Bots granted can_post_messages permissions can delete outgoing messages
  /// in channels.
  /// - If the bot is an administrator of a group, it can delete an
  /// message there.
  /// - If the bot has can_delete_messages permission in a supergroup or
  /// a channel, it can delete any message there.
  ///
  /// Returns True on success.
  Future<bool> deleteMessage(ChatID chatId, int messageId) {
    return _client.apiCall(_token, 'deleteMessage', {
      'chat_id': chatId,
      'message_id': messageId,
    });
  }

  /// Use this method to delete multiple messages simultaneously.
  ///
  /// If some of the specified messages can't be found, they are skipped.
  ///
  /// Returns True on success.
  Future<bool> deleteMessages(ChatID chatId, List<int> messageIds) {
    return _client.apiCall(_token, 'deleteMessages', {
      'chat_id': chatId,
      'message_ids': messageIds,
    });
  }

  /// Use this method to send static .WEBP, animated .TGS,
  /// or video .WEBM stickers.
  ///
  /// On success, the sent [Message] is returned.
  Future<Message> sendSticker(
    ChatID chatId,
    HttpFile sticker, {
    String? businessConnectionId,
    int? messageThreadId,
    String? emoji,
    bool? disableNotification,
    bool? protectContent,
    String? messageEffectId,
    ReplyParameters? replyParameters,
    ReplyMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'sendSticker', {
      'business_connection_id': businessConnectionId,
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'sticker': sticker,
      'emoji': emoji,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'message_effect_id': messageEffectId,
      'reply_parameters': replyParameters,
      'reply_markup': replyMarkup,
    });
  }

  /// Use this method to get a sticker set.
  ///
  /// On success, a [StickerSet] object is returned.
  Future<StickerSet> getStickerSet(String name) {
    return _client.apiCall(_token, 'getStickerSet', {'name': name});
  }

  /// Use this method to get information about
  /// custom emoji stickers by their identifiers.
  /// Returns an Array of [Sticker] objects
  Future<List<Sticker>> getCustomEmojiStickers(List<String> customEmojiIds) {
    return _client.apiCall(_token, 'getCustomEmojiStickers', {
      'custom_emoji_ids': getCustomEmojiStickers,
    });
  }

  /// Use this method to upload a .PNG file with a sticker for later use in
  /// [createNewStickerSet] and [addStickerToSet] methods
  /// (can be used multiple times).
  ///
  /// Returns the uploaded [File] on success.
  Future<File> uploadStickerFile(
    String userId,
    InputSticker sticker,
    String stickerFormat,
  ) {
    return _client.apiCall(_token, 'uploadStickerFile', {
      'user_id': userId,
      'sticker': sticker,
      'sticker_format': stickerFormat,
    });
  }

  /// Use this method to create a new sticker set owned by a user.
  ///
  /// The bot will be able to edit the sticker set thus created.
  ///
  /// Returns True on success.
  Future<bool> createNewStickerSet(
    String userId,
    String name,
    String title,
    String emojis,
    List<InputSticker> stickers, {
    String? stickerType,
    bool? needsRepainting,
  }) {
    return _client.apiCall(_token, 'createNewStickerSet', {
      'user_id': userId,
      'name': name,
      'title': title,
      'stickers': stickers,
      'sticker_type': stickerType,
      'needs_repainting': needsRepainting,
    });
  }

  /// Use this method to add a new sticker to a set created by the bot.
  ///
  /// Animated stickers can be added to animated sticker sets and only to them.
  ///
  /// Animated sticker sets can have up to 50 stickers.
  ///
  /// Static sticker sets can have up to 120 stickers.
  ///
  /// Returns True on success.
  Future<bool> addStickerToSet(
    String userId,
    String name,
    InputSticker sticker,
  ) {
    return _client.apiCall(_token, 'addStickerToSet', {
      'user_id': userId,
      'name': name,
      'sticker': sticker,
    });
  }

  /// Use this method to move a sticker in a set created by the bot to
  /// a specific position.
  ///
  /// Returns True on success.
  Future<bool> setStickerPositionInSet(String sticker, int position) {
    return _client.apiCall(_token, 'setStickerPositionInSet', {
      'sticker': sticker,
      'position': position,
    });
  }

  /// Use this method to delete a sticker from a set created by the bot.
  ///
  /// Returns True on success.
  Future<bool> deleteStickerFromSet(String sticker) {
    return _client.apiCall(_token, 'deleteStickerFromSet', {
      'sticker': sticker,
    });
  }

  /// Use this method to replace an existing sticker in a sticker set with a
  /// new one.
  ///
  /// The method is equivalent to calling deleteStickerFromSet,
  /// then addStickerToSet, then setStickerPositionInSet.
  ///
  /// Returns True on success.
  Future<bool> replaceStickerInSet(
    int userId,
    String name,
    String oldSticker,
    HttpFile sticker,
  ) {
    return _client.apiCall(_token, 'replaceStickerInSet', {
      'user_id': userId,
      'name': name,
      'old_sticker': oldSticker,
      'sticker': sticker,
    });
  }

  /// Use this method to change the list of emoji assigned to a regular or
  /// custom emoji sticker.
  /// The sticker must belong to a sticker set created by the bot.
  ///
  /// Returns True on success.
  Future<bool> setStickerEmojiList(String sticker, List<String> emojiList) {
    return _client.apiCall(_token, 'setStickerEmojiList', {
      'sticker': sticker,
      'emoji_list': emojiList,
    });
  }

  /// Use this method to change search keywords assigned to a regular or
  /// custom emoji sticker. The sticker must belong to a sticker set created
  /// by the bot.
  ///
  /// Returns True on success.
  Future<bool> setStickerKeywords(String sticker, List<String> keywords) {
    return _client.apiCall(_token, 'setStickerKeywords', {
      'sticker': sticker,
      'keywords': keywords,
    });
  }

  /// Use this method to change the mask position of a mask sticker.
  /// The sticker must belong to a sticker set that was created by the bot.
  ///
  /// Returns True on success.
  Future<bool> setStickerMaskPosition(
    String sticker, {
    MaskPosition? maskPosition,
  }) {
    return _client.apiCall(_token, 'setStickerMaskPosition', {
      'sticker': sticker,
      'mask_position': maskPosition,
    });
  }

  /// Use this method to set the title of a created sticker set.
  ///
  /// Returns True on success.
  Future<bool> setStickerSetTitle(String name, String title) {
    return _client.apiCall(_token, 'setStickerSetTitle', {
      'name': name,
      'title': title,
    });
  }

  /// Use this method to set the thumbnail of a sticker set.
  /// Animated thumbnails can be set for animated sticker sets only.
  /// Video thumbnails can be set only for video sticker sets only.
  ///
  /// Returns True on success.
  Future<bool> setStickerSetThumbnail(
    String name,
    String userId,
    String format, {
    HttpFile? thumbnail,
  }) {
    return _client.apiCall(_token, 'setStickerSetThumbnail', {
      'name': name,
      'user_id': userId,
      'thumbnail': thumbnail,
      'format': format,
    });
  }

  /// Use this method to set the thumbnail of a custom emoji sticker set.
  ///
  /// Returns True on success.
  Future<bool> setCustomEmojiStickerSetThumbnail(
    String name, {
    String? customEmojiId,
  }) {
    return _client.apiCall(_token, 'setCustomEmojiStickerSetThumbnail', {
      'name': name,
      'custom_emoji_id': customEmojiId,
    });
  }

  /// Use this method to delete a sticker set that was created by the bot.
  ///
  /// Returns True on success.
  Future<bool> deleteStickerSet(String name) {
    return _client.apiCall(_token, 'deleteStickerSet', {
      'name': name,
    });
  }

  /// Use this method to send answers to an inline query.
  ///
  /// On success, True is returned.
  /// No more than 50 results per query are allowed.
  Future<bool> answerInlineQuery(
    String inlineQueryId,
    List<InlineQueryResult> results, {
    int? cacheTime,
    bool? isPersonal,
    String? nextOffset,
    InlineQueryResultsButton? button,
  }) {
    return _client.apiCall(_token, 'answerInlineQuery', {
      'inline_query_id': inlineQueryId,
      'results': results,
      'cache_time': cacheTime,
      'is_personal': isPersonal,
      'next_offset': nextOffset,
      'button': button,
    });
  }

  /// Use this method to set the result of an interaction with a Web App and
  /// send a corresponding message on behalf of the user to the chat from which
  /// the query originated.
  ///
  /// On success, a [SentWebAppMessage] object is returned.
  Future<SentWebAppMessage> answerWebAppQuery(
    String webAppQueryId,
    InlineQueryResult? result,
  ) {
    return _client.apiCall(_token, 'answerWebAppQuery', {
      'web_app_query_id': webAppQueryId,
      'result': result,
    });
  }

  /// Use this method to send invoices.
  ///
  /// On success, the sent [Message] is returned.
  Future<Message> sendInvoice(
    ChatID chatId,
    String title,
    String description,
    String payload,
    String providerToken,
    String currency,
    List<LabeledPrice> prices, {
    int? messageThreadId,
    int? maxTipAmount,
    List<int>? suggestedTipAmounts,
    String? startParameter,
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
    bool? protectContent,
    String? messageEffectId,
    ReplyParameters? replyParameters,
    InlineKeyboardMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'sendInvoice', {
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'title': title,
      'description': description,
      'payload': payload,
      'provider_token': providerToken,
      'currency': currency,
      'prices': prices,
      'max_tip_amount': maxTipAmount,
      'suggested_tip_amounts': suggestedTipAmounts,
      'start_parameter': startParameter,
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
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'message_effect_id': messageEffectId,
      'reply_parameters': replyParameters,
      'reply_markup': replyMarkup,
    });
  }

  /// Use this method to send invoices for payments in
  /// [Telegram Stars](https://t.me/BotNews/90).
  ///
  /// On success, the sent [Message] is returned.
  Future<Message> sendInvoiceStars(
    ChatID chatId,
    String title,
    String description,
    String payload,
    LabeledPrice price, {
    int? messageThreadId,
    String? startParameter,
    String? providerData,
    String? photoUrl,
    int? photoSize,
    int? photoWidth,
    int? photoHeight,
    bool? disableNotification,
    bool? protectContent,
    String? messageEffectId,
    ReplyParameters? replyParameters,
    InlineKeyboardMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'sendInvoice', {
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'title': title,
      'description': description,
      'payload': payload,
      'currency': 'XTR',
      'prices': [price],
      'start_parameter': startParameter,
      'provider_data': providerData,
      'photo_url': photoUrl,
      'photo_size': photoSize,
      'photo_width': photoWidth,
      'photo_height': photoHeight,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'message_effect_id': messageEffectId,
      'reply_parameters': replyParameters,
      'reply_markup': replyMarkup,
    });
  }

  /// Use this method to create a link for an invoice.
  ///
  /// Returns the created invoice link as String on success.
  Future<String> createInvoiceLink(
    String title,
    String description,
    String payload,
    String providerToken,
    String currency,
    List<LabeledPrice> prices, {
    int? maxTipAmount,
    List<int>? suggestedTipAmounts,
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
  }) {
    return _client.apiCall(_token, 'createInvoiceLink', {
      'title': title,
      'description': description,
      'payload': payload,
      'provider_token': providerToken,
      'currency': currency,
      'prices': prices,
      'max_tip_amount': maxTipAmount,
      'suggested_tip_amounts': suggestedTipAmounts,
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
    });
  }

  /// Use this method to create a link for an invoice for payments in
  /// [Telegram Stars](https://t.me/BotNews/90).
  ///
  /// Returns the created invoice link as String on success.
  Future<String> createInvoiceLinkStars(
    String title,
    String description,
    String payload,
    LabeledPrice price, {
    String? providerData,
    String? photoUrl,
    int? photoSize,
    int? photoWidth,
    int? photoHeight,
  }) {
    return _client.apiCall(_token, 'createInvoiceLink', {
      'title': title,
      'description': description,
      'payload': payload,
      'currency': 'XTR',
      'prices': [price],
      'provider_data': providerData,
      'photo_url': photoUrl,
      'photo_size': photoSize,
      'photo_width': photoWidth,
      'photo_height': photoHeight,
    });
  }

  /// If you sent an invoice requesting a shipping address and the parameter
  /// is_flexible was specified, the Bot API will send an [Update] with a
  /// shipping_query field to the bot.
  ///
  /// Use this method to reply to shipping queries.
  ///
  /// On success, True is returned.
  Future<bool> answerShippingQuery(
    String shippingQueryId,
    List<ShippingOption>? shippingOptions,
    String errorMessage, {
    required bool ok,
  }) {
    return _client.apiCall(_token, 'answerShippingQuery', {
      'shipping_query_id': shippingQueryId,
      'ok': ok,
      'shipping_options': shippingOptions,
      'error_message': errorMessage,
    });
  }

  /// Once the user has confirmed their payment and shipping details,
  /// the Bot API sends the final confirmation in the form of an Update with
  /// the field pre_checkout_query.
  ///
  /// Use this method to respond to such pre-checkout queries.
  ///
  /// On success, True is returned.
  ///
  /// Note: The Bot API must receive an answer within 10 seconds after the
  /// pre-checkout query was sent.
  Future<bool> answerPreCheckoutQuery(
    String preCheckoutQueryId,
    String errorMessage, {
    required bool ok,
  }) {
    return _client.apiCall(_token, 'answerPreCheckoutQuery', {
      'pre_checkout_query_id': preCheckoutQueryId,
      'ok': ok,
      'error_message': errorMessage,
    });
  }

  /// Returns the bot's Telegram Star transactions in chronological order.
  ///
  /// On success, returns a [StarTransactions] object.
  Future<StarTransactions> getStarTransactions(int offset, int limit) {
    return _client.apiCall(_token, 'getStarTransactions', {
      'offset': offset,
      'limit': limit,
    });
  }

  /// Refunds a successful payment in [Telegram Stars](https://t.me/BotNews/90).
  ///
  /// Returns `true` on success.
  Future<bool> refundStarPayment(int userId, String telegramPaymentChargeId) {
    return _client.apiCall(_token, 'refundStarPayment', {
      'user_id': userId,
      'telegram_payment_charge_id': telegramPaymentChargeId,
    });
  }

  /// Use this method to send a game.
  ///
  /// On success, the sent [Message] is returned.
  Future<Message> sendGame(
    ChatID chatId,
    String gameShortName, {
    String? businessConnectionId,
    int? messageThreadId,
    bool? disableNotification,
    bool? protectContent,
    String? messageEffectId,
    ReplyParameters? replyParameters,
    InlineKeyboardMarkup? replyMarkup,
  }) {
    return _client.apiCall(_token, 'sendGame', {
      'business_connection_id': businessConnectionId,
      'chat_id': chatId,
      'message_thread_id': messageThreadId,
      'game_short_name': gameShortName,
      'disable_notification': disableNotification,
      'protect_content': protectContent,
      'message_effect_id': messageEffectId,
      'reply_parameters': replyParameters,
      'reply_markup': replyMarkup,
    });
  }

  /// Use this method to set the score of the specified user in a game message.
  ///
  /// On success, the [Message] is returned.
  ///
  /// Returns an error, if the new score is not greater than the user's current
  /// score in the chat and [force] is False.
  Future<Message> setGameScore(
    int userId,
    int score, {
    bool? force,
    bool? disableEditMessage,
    ChatID? chatId,
    int? messageId,
  }) {
    return _client.apiCall(_token, 'setGameScore', {
      'user_id': userId,
      'score': score,
      'force': force,
      'disable_edit_message': disableEditMessage,
      'chat_id': chatId,
      'message_id': messageId,
    });
  }

  /// Use this method to set the score of the specified user in a game message.
  ///
  /// On success, True is returned.
  ///
  /// Returns an error, if the new score is not greater than the user's current
  /// score in the chat and [force] is False.
  Future<bool> setGameScoreInline(
    int userId,
    int score, {
    bool? force,
    bool? disableEditMessage,
    String? inlineMessageId,
  }) {
    return _client.apiCall(_token, 'setGameScore', {
      'user_id': userId,
      'score': score,
      'force': force,
      'disable_edit_message': disableEditMessage,
      'inline_message_id': inlineMessageId,
    });
  }

  /// Use this method to get data for high score tables.
  /// Will return the score of the specified user and several of their neighbors
  /// in a game.
  ///
  /// On success, returns an Array of [GameHighScore] objects
  Future<List<GameHighScore>> getGameHighScores(
    int userId, {
    ChatID? chatId,
    int? messageId,
  }) {
    return _client.apiCall(_token, 'getGameHighScores', {
      'user_id': userId,
      'chat_id': chatId,
      'message_id': messageId,
    });
  }

  /// Use this method to get data for high score tables.
  /// Will return the score of the specified user and several of their neighbors
  /// in a game.
  /// Returns an Array of [GameHighScore] objects.
  Future<List<GameHighScore>> getGameHighScoresInline(
    int userId, {
    String? inlineMessageId,
  }) {
    return _client.apiCall(_token, 'getGameHighScores', {
      'user_id': userId,
      'inline_message_id': inlineMessageId,
    });
  }

  /// Use this method to log out from the cloud Bot API server before launching
  /// the bot locally.
  /// You must log out the bot before running it locally, otherwise there
  /// is no guarantee that the bot will receive updates.
  ///
  /// After a successful call, you can immediately log in on a local server, but
  /// will not be able to log in back to the cloud Bot API server for 10 minutes
  ///
  /// Returns True on success.
  ///
  /// Requires no parameters.
  Future<bool> logOut() => _client.apiCall(_token, 'logOut');

  /// Use this method to close the bot instance before moving it from one
  /// local server to another.
  /// You need to delete the webhook before calling this method to ensure that
  /// the bot isn't launched again after server restart.
  ///
  /// The method will return error 429 in the first 10 minutes after the bot
  /// is launched.
  ///
  /// Returns True on success.
  ///
  /// Requires no parameters.
  Future<bool> close() => _client.apiCall(_token, 'close');

  /// Use this method to remove webhook integration if you decide to switch
  /// back to getUpdates.
  /// Returns True on success.
  Future<bool> deleteWebhook({bool? dropPendingUpdates}) {
    return _client.apiCall(_token, 'deleteWebhook', {
      'drop_pending_updates': dropPendingUpdates,
    });
  }

  /// Download a file from path
  Future<Uint8List> download(String path) {
    return _client.apiDownload(_token, path);
  }
}
