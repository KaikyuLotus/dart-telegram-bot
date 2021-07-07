class _Enum<T> {
  final T _value;

  T get value => _value;

  const _Enum(this._value);

  @override
  String toString() => '$_value';

  String toJson() => '$this';
}

class UpdateType extends _Enum<String> {
  static const message = UpdateType._('message');
  static const editedMessage = UpdateType._('edited_message');
  static const channelPost = UpdateType._('channel_post');
  static const inlineQuery = UpdateType._('inline_query');
  static const chosenInlineResult = UpdateType._('chosen_inline_result');
  static const callbackQuery = UpdateType._('callback_query');
  static const shippingQuery = UpdateType._('shipping_query');
  static const preCheckoutQuery = UpdateType._('pre_checkout_query');
  static const poll = UpdateType._('poll');
  static const pollAnswer = UpdateType._('poll_answer');
  static const myChatMember = UpdateType._('my_chat_member');
  static const chatMember = UpdateType._('chat_member');

  static const values = {
    'message': message,
    'edited_message': editedMessage,
    'channel_post': channelPost,
    'inline_query': inlineQuery,
    'chosen_inline_result': chosenInlineResult,
    'callback_query': callbackQuery,
    'shipping_query': shippingQuery,
    'pre_checkout_query': preCheckoutQuery,
    'poll': poll,
    'poll_answer': pollAnswer,
    'my_chat_member': myChatMember,
    'chat_member': chatMember,
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
  static const markdown = ParseMode._('markdown');
  static const markdownV2 = ParseMode._('markdownv2');
  static const html = ParseMode._('html');

  static const values = {
    'markdown': markdown,
    'markdownv2': markdownV2,
    'html': html,
  };

  const ParseMode._(String value) : super(value);

  static ParseMode forValue(String value) => ParseMode.values[value]!;
}

class PollType extends _Enum<String> {
  static const regular = PollType._('regular');
  static const quiz = PollType._('quiz');

  static const values = {
    'regular': regular,
    'quiz': quiz,
  };

  const PollType._(String value) : super(value);

  static PollType forValue(String value) => PollType.values[value]!;
}

class ChatAction extends _Enum<String> {
  static const typing = ChatAction._('typing');
  static const uploadPhoto = ChatAction._('upload_photo');
  static const recordVideo = ChatAction._('record_video');
  static const uploadVideo = ChatAction._('upload_video');
  static const recordAudio = ChatAction._('record_audio');
  static const uploadAudio = ChatAction._('upload_audio');
  static const uploadDocument = ChatAction._('upload_document');
  static const findLocation = ChatAction._('find_location');
  static const recordVideoNote = ChatAction._('record_video_note');
  static const uploadVideoNote = ChatAction._('upload_video_note');

  static const values = {
    'typing': typing,
    'upload_photo': uploadPhoto,
    'record_video': recordVideo,
    'upload_video': uploadVideo,
    'record_audio': recordAudio,
    'upload_audio': uploadAudio,
    'upload_document': uploadDocument,
    'find_location': findLocation,
    'record_video_note': recordVideoNote,
    'upload_video_note': uploadVideoNote,
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
