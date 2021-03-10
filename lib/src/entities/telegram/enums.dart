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

  static final _validValues = <String>['🎲', '🎯', '🏀', '⚽', '🎳', '🎰'];

  static final Emoji DICE = Emoji._('🎲');
  static final Emoji DART = Emoji._('🎯');
  static final Emoji BASKETBALL = Emoji._('🏀');
  static final Emoji FOOTBALL = Emoji._('⚽');
  static final Emoji BOWLING = Emoji._('🎳');
  static final Emoji CASINO = Emoji._('🎰');

  Emoji._(this._emoji);

  Emoji fromString(String emoji) {
    if (!_validValues.contains(emoji)) {
      throw ArgumentError.value(emoji, 'Unknown emoji');
    }
    return Emoji._(emoji);
  }

  @override
  String toString() {
    return _emoji;
  }
}
