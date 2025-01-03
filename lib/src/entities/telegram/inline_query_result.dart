import '../../../telegram_entities.dart';

/// This object represents one result of an inline query.
///
/// Telegram clients currently support results of the following 20 types:
/// [InlineQueryResultCachedAudio],
/// [InlineQueryResultCachedDocument],
/// [InlineQueryResultCachedGif],
/// [InlineQueryResultCachedMpeg4Gif],
/// [InlineQueryResultCachedPhoto],
/// [InlineQueryResultCachedSticker],
/// [InlineQueryResultCachedVideo],
/// [InlineQueryResultCachedVoice],
/// [InlineQueryResultArticle],
/// [InlineQueryResultAudio],
/// [InlineQueryResultContact],
/// [InlineQueryResultGame],
/// [InlineQueryResultDocument],
/// [InlineQueryResultGif],
/// [InlineQueryResultLocation],
/// [InlineQueryResultMpeg4Gif],
/// [InlineQueryResultPhoto],
/// [InlineQueryResultVenue],
/// [InlineQueryResultVideo],
/// [InlineQueryResultVoice]
abstract class InlineQueryResult {
  abstract String type;

  abstract String id;
}
