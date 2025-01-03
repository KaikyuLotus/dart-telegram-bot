class _Enum<T> {
  final T _value;

  T get value => _value;

  const _Enum(this._value);

  @override
  String toString() => '$_value';

  String toJson() => '$this';
}

/// UpdateType for GetUpdates
class UpdateType extends _Enum<String> {
  /// Message
  static const message = UpdateType._('message');

  /// EditedMessage
  static const editedMessage = UpdateType._('edited_message');

  /// ChannelPost
  static const channelPost = UpdateType._('channel_post');

  /// EditedChannelPost
  static const editedChannelPost = UpdateType._('edited_channel_post');

  /// BusinessConnection
  static const businessConnection = UpdateType._('business_connection');

  /// BusinessMessage
  static const businessMessage = UpdateType._('business_message');

  /// EditedBusinessMessage
  static const editedBusinessMessage = UpdateType._('edited_business_message');

  /// DeletedBusinessMessages
  static const deletedBusinessMessages =
      UpdateType._('deleted_business_messages');

  /// MessageReaction
  static const messageReaction = UpdateType._('message_reaction');

  /// MessageReactionCount
  static const messageReactionCount = UpdateType._('message_reaction_count');

  /// InlineQuery
  static const inlineQuery = UpdateType._('inline_query');

  /// ChosenInlineResult
  static const chosenInlineResult = UpdateType._('chosen_inline_result');

  /// CallbackQuery
  static const callbackQuery = UpdateType._('callback_query');

  /// ShippingQuery
  static const shippingQuery = UpdateType._('shipping_query');

  /// PreCheckoutQuery
  static const preCheckoutQuery = UpdateType._('pre_checkout_query');

  /// PurchasedPaidMedia
  static const purchasedPaidMedia = UpdateType._('purchased_paid_media');

  /// Poll
  static const poll = UpdateType._('poll');

  /// PollAnswer
  static const pollAnswer = UpdateType._('poll_answer');

  /// MyChatMember
  static const myChatMember = UpdateType._('my_chat_member');

  /// ChatMember
  static const chatMember = UpdateType._('chat_member');

  /// ChatJoinRequest
  static const chatJoinRequest = UpdateType._('chat_join_request');

  /// ChatBoost
  static const chatBoost = UpdateType._('chat_boost');

  /// RemovedChatBoost
  static const removedChatBoost = UpdateType._('removed_chat_boost');

  /// Values
  static const values = {
    'message': message,
    'edited_message': editedMessage,
    'channel_post': channelPost,
    'edited_channel_post': editedChannelPost,
    'business_connection': businessConnection,
    'business_message': businessMessage,
    'edited_business_message': editedBusinessMessage,
    'deleted_business_messages': deletedBusinessMessages,
    'message_reaction': messageReaction,
    'message_reaction_count': messageReactionCount,
    'inline_query': inlineQuery,
    'chosen_inline_result': chosenInlineResult,
    'callback_query': callbackQuery,
    'shipping_query': shippingQuery,
    'pre_checkout_query': preCheckoutQuery,
    'purchased_paid_media': purchasedPaidMedia,
    'poll': poll,
    'poll_answer': pollAnswer,
    'my_chat_member': myChatMember,
    'chat_member': chatMember,
    'chat_join_request': chatJoinRequest,
    'chat_boost': chatBoost,
    'removed_chat_boost': removedChatBoost,
  };

  /// Get a list with all UpdateType
  static List<UpdateType> get all => values.values.toList();

  /// Get a list with allBut UpdateType
  static List<UpdateType> allBut(Iterable<UpdateType> exclusions) {
    return all
      ..removeWhere(exclusions.contains)
      ..toList();
  }

  const UpdateType._(super.value);

  /// Get the object from string
  static UpdateType forValue(String value) => UpdateType.values[value]!;
}

/// Message ParseMode
class ParseMode extends _Enum<String> {
  /// Markdown
  static const markdown = ParseMode._('markdown');

  /// Markdown V2
  static const markdownV2 = ParseMode._('markdownv2');

  /// HTML
  static const html = ParseMode._('html');

  /// Values
  static const values = {
    'markdown': markdown,
    'markdownv2': markdownV2,
    'html': html,
  };

  const ParseMode._(super.value);

  /// Get the object from string
  static ParseMode forValue(String value) => ParseMode.values[value]!;
}

/// PollType
class PollType extends _Enum<String> {
  /// Reqular
  static const regular = PollType._('regular');

  /// Quiz
  static const quiz = PollType._('quiz');

  /// Values
  static const values = {
    'regular': regular,
    'quiz': quiz,
  };

  const PollType._(super.value);

  /// Get the object from string
  static PollType forValue(String value) => PollType.values[value]!;
}

/// ChatAction
class ChatAction extends _Enum<String> {
  /// Typing
  static const typing = ChatAction._('typing');

  /// UploadPhoto
  static const uploadPhoto = ChatAction._('upload_photo');

  /// RecordVideo
  static const recordVideo = ChatAction._('record_video');

  /// UploadVideo
  static const uploadVideo = ChatAction._('upload_video');

  /// RecordVoice
  static const recordVoice = ChatAction._('record_voice');

  /// UploadVoice
  static const uploadVoice = ChatAction._('upload_voice');

  /// UploadDocument
  static const uploadDocument = ChatAction._('upload_document');

  /// ChooseSticker
  static const chooseSticker = ChatAction._('choose_sticker');

  /// FindLocation
  static const findLocation = ChatAction._('find_location');

  /// RecordVideoNote
  static const recordVideoNote = ChatAction._('record_video_note');

  /// UploadVideoNote
  static const uploadVideoNote = ChatAction._('upload_video_note');

  /// Values
  static const values = {
    'typing': typing,
    'upload_photo': uploadPhoto,
    'record_video': recordVideo,
    'upload_video': uploadVideo,
    'record_voice': recordVoice,
    'upload_voice': uploadVoice,
    'upload_document': uploadDocument,
    'choose_sticker': chooseSticker,
    'find_location': findLocation,
    'record_video_note': recordVideoNote,
    'upload_video_note': uploadVideoNote,
  };

  const ChatAction._(super.value);

  /// Get the object from string
  static ChatAction forValue(String value) => ChatAction.values[value]!;
}

/// Dice Emoji
class Emoji extends _Enum<String> {
  /// Dice
  static const dice = Emoji._('🎲');

  /// Dart
  static const dart = Emoji._('🎯');

  /// Basketball
  static const basketball = Emoji._('🏀');

  /// Football
  static const football = Emoji._('⚽');

  /// Bowling
  static const bowling = Emoji._('🎳');

  /// Casino
  static const casino = Emoji._('🎰');

  /// Values
  static const values = {
    '🎲': dice,
    '🎯': dart,
    '🏀': basketball,
    '⚽': football,
    '🎳': bowling,
    '🎰': casino,
  };

  const Emoji._(super.value);

  /// Get the object from string
  static Emoji forValue(String value) => Emoji.values[value]!;
}

/// StickerFormat
class StickerFormat extends _Enum<String> {
  /// Static
  static const static = StickerFormat._('static');

  /// Animated
  static const animated = StickerFormat._('animated');

  /// Video
  static const video = StickerFormat._('video');

  /// Values
  static const values = {
    'static': static,
    'animated': animated,
    'video': video,
  };

  const StickerFormat._(super.value);

  /// Get the object from string
  static StickerFormat forValue(String value) => StickerFormat.values[value]!;
}

/// StickerType
class StickerType extends _Enum<String> {
  /// Regular
  static const regular = StickerType._('regular');

  /// Mask
  static const mask = StickerType._('mask');

  /// Custom Emoji
  static const customEmoji = StickerType._('custom_emoji');

  /// Values
  static const values = {
    'regular': regular,
    'mask': mask,
    'custom_emoji': customEmoji,
  };

  const StickerType._(super.value);

  /// Get the object from string
  static StickerType forValue(String value) => StickerType.values[value]!;
}
