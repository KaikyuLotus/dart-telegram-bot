enum UpdateType {
  MESSAGE,
  EDITED_MESSAGE,
  CHANNEL_POST,
  INLINE_QUERY,
  CHOSEN_INLINE_RESULT,
  CALLBACK_QUERY,
  SHIPPING_QUERY,
  PRE_CHECKOUT_QUERY,
  POLL,
  POLL_ANSWER,
  MY_CHAT_MEMBER,
  CHAT_MEMBER,
}

enum ParseMode {
  MARKDOWN,
  MARKDOWNV2,
  HTML,
}

enum PollType {
  REGULAR,
  QUIZ,
}

enum ChatAction {
  TYPING,
  UPLOAD_PHOTO,
  RECORD_VIDEO,
  UPLOAD_VIDEO,
  RECORD_AUDIO,
  UPLOAD_AUDIO,
  UPLOAD_DOCUMENT,
  FIND_LOCATION,
  RECORD_VIDEO_NOTE,
  UPLOAD_VIDEO_NOTE,
}

class Emoji {
  final String _emoji;

  static const _values = {
    '🎲': DICE,
    '🎯': DART,
    '🏀': BASKETBALL,
    '⚽': FOOTBALL,
    '🎳': BOWLING,
    '🎰': CASINO,
  };

  static const Emoji DICE = Emoji._('🎲');
  static const Emoji DART = Emoji._('🎯');
  static const Emoji BASKETBALL = Emoji._('🏀');
  static const Emoji FOOTBALL = Emoji._('⚽');
  static const Emoji BOWLING = Emoji._('🎳');
  static const Emoji CASINO = Emoji._('🎰');

  const Emoji._(this._emoji);

  Emoji forValue(String emoji) => _values[emoji]!;

  @override
  String toString() => _emoji;
}
