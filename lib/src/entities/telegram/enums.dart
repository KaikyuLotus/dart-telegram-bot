class _Enum<T> {
  final T _value;

  T get value => _value;

  const _Enum(this._value);

  @override
  String toString() => '$_value';

  String toJson() => '$this';
}

class UpdateType extends _Enum<String> {
  static const message = UpdateType._('MESSAGE');
  static const editedMessage = UpdateType._('EDITED_MESSAGE');
  static const channelPost = UpdateType._('CHANNEL_POST');
  static const inlineQuery = UpdateType._('INLINE_QUERY');
  static const chosenInlineResult = UpdateType._('CHOSEN_INLINE_RESULT');
  static const callbackQuery = UpdateType._('CALLBACK_QUERY');
  static const shippingQuery = UpdateType._('SHIPPING_QUERY');
  static const preCheckoutQuery = UpdateType._('PRE_CHECKOUT_QUERY');
  static const poll = UpdateType._('POLL');
  static const pollAnswer = UpdateType._('POLL_ANSWER');
  static const myChatMember = UpdateType._('MY_CHAT_MEMBER');
  static const chatMember = UpdateType._('CHAT_MEMBER');

  static const values = {
    'MESSAGE': message,
    'EDITED_MESSAGE': editedMessage,
    'CHANNEL_POST': channelPost,
    'INLINE_QUERY': inlineQuery,
    'CHOSEN_INLINE_RESULT': chosenInlineResult,
    'CALLBACK_QUERY': callbackQuery,
    'SHIPPING_QUERY': shippingQuery,
    'PRE_CHECKOUT_QUERY': preCheckoutQuery,
    'POLL': poll,
    'POLL_ANSWER': pollAnswer,
    'MY_CHAT_MEMBER': myChatMember,
    'CHAT_MEMBER': chatMember,
  };

  static List<UpdateType> get all => values.values.toList();

  static List<UpdateType> allBut(Iterable<UpdateType> exclusions) {
    return all
      ..removeWhere(exclusions.contains)
      ..toList();
  }

  const UpdateType._(String value) : super(value);

  static UpdateType forValue(String value) => UpdateType.values[value]!;
}

class ParseMode extends _Enum<String> {
  static const markdown = ParseMode._('MARKDOWN');
  static const markdownV2 = ParseMode._('MARKDOWNV2');
  static const html = ParseMode._('HTML');

  static const values = {
    'MARKDOWN': markdown,
    'MARKDOWNV2': markdownV2,
    'HTML': html,
  };

  const ParseMode._(String value) : super(value);

  static ParseMode forValue(String value) => ParseMode.values[value]!;
}

class PollType extends _Enum<String> {
  static const regular = PollType._('REGULAR');
  static const quiz = PollType._('QUIZ');

  static const values = {
    'REGULAR': regular,
    'QUIZ': quiz,
  };

  const PollType._(String value) : super(value);

  static PollType forValue(String value) => PollType.values[value]!;
}

class ChatAction extends _Enum<String> {
  static const typing = ChatAction._('TYPING');
  static const uploadPhoto = ChatAction._('UPLOAD_PHOTO');
  static const recordVideo = ChatAction._('RECORD_VIDEO');
  static const uploadVideo = ChatAction._('UPLOAD_VIDEO');
  static const recordAudio = ChatAction._('RECORD_AUDIO');
  static const uploadAudio = ChatAction._('UPLOAD_AUDIO');
  static const uploadDocument = ChatAction._('UPLOAD_DOCUMENT');
  static const findLocation = ChatAction._('FIND_LOCATION');
  static const recordVideoNote = ChatAction._('RECORD_VIDEO_NOTE');
  static const uploadVideoNote = ChatAction._('UPLOAD_VIDEO_NOTE');

  static const values = {
    'TYPING': typing,
    'UPLOAD_PHOTO': uploadPhoto,
    'RECORD_VIDEO': recordVideo,
    'UPLOAD_VIDEO': uploadVideo,
    'RECORD_AUDIO': recordAudio,
    'UPLOAD_AUDIO': uploadAudio,
    'UPLOAD_DOCUMENT': uploadDocument,
    'FIND_LOCATION': findLocation,
    'RECORD_VIDEO_NOTE': recordVideoNote,
    'UPLOAD_VIDEO_NOTE': uploadVideoNote,
  };

  const ChatAction._(String value) : super(value);

  static ChatAction forValue(String value) => ChatAction.values[value]!;
}

class Emoji extends _Enum<String> {
  static const dice = Emoji._('🎲');
  static const dart = Emoji._('🎯');
  static const basketball = Emoji._('🏀');
  static const football = Emoji._('⚽');
  static const bowling = Emoji._('🎳');
  static const casino = Emoji._('🎰');

  static const values = {
    '🎲': dice,
    '🎯': dart,
    '🏀': basketball,
    '⚽': football,
    '🎳': bowling,
    '🎰': casino,
  };

  const Emoji._(String value) : super(value);

  static Emoji forValue(String value) => Emoji.values[value]!;
}
