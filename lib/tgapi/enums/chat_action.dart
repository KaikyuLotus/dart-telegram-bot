class ChatAction {
  // FIXME find a better way to handle this kind of enum, it works but ugh...
  static final ChatAction TYPING = ChatAction._('TYPING');
  static final ChatAction UPLOAD_PHOTO = ChatAction._('UPLOAD_PHOTO');
  static final ChatAction RECORD_VIDEO = ChatAction._('RECORD_VIDEO');
  static final ChatAction UPLOAD_VIDEO = ChatAction._('UPLOAD_VIDEO');
  static final ChatAction RECORD_AUDIO = ChatAction._('RECORD_AUDIO');
  static final ChatAction UPLOAD_AUDIO = ChatAction._('UPLOAD_AUDIO');
  static final ChatAction UPLOAD_DOCUMENT = ChatAction._('UPLOAD_DOCUMENT');
  static final ChatAction FIND_LOCATION = ChatAction._('FIND_LOCATION');
  static final ChatAction RECORD_VIDEO_NOTE = ChatAction._('RECORD_VIDEO_NOTE');
  static final ChatAction UPLOAD_VIDEO_NOTE = ChatAction._('UPLOAD_VIDEO_NOTE');

  final String _action;

  ChatAction._(this._action);

  @override
  String toString() {
    return _action;
  }
}
