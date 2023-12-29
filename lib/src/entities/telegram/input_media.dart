/// This object represents the content of a media message to be sent.
/// It should be one of:
/// InputMediaAnimation,
/// InputMediaDocument,
/// InputMediaAudio,
/// InputMediaPhoto,
/// InputMediaVideo
abstract class InputMedia {
  abstract final String type;
  abstract dynamic media;
}
