import 'dart:convert';

import '../../../telegram_entities.dart';

/// This object describes a sticker to be added to a sticker set.
class InputSticker {
  /// The added sticker.
  ///
  /// Pass a *file_id* as a String to send a file that already exists on the
  /// Telegram servers, pass an HTTP URL as a String for Telegram to get a file
  /// from the Internet, upload a new one using multipart/form-data, or pass
  /// “attach://<file_attach_name>” to upload a new one using
  /// multipart/form-data under <file_attach_name> name.
  ///
  /// Animated and video stickers can't be uploaded via HTTP URL.
  HttpFile sticker;

  /// Format of the added sticker, must be one of
  /// “static” for a **.WEBP** or **.PNG** image,
  /// “animated” for a **.TGS** animation,
  /// “video” for a **WEBM** video
  StickerFormat format;

  /// List of 1-20 emoji associated with the sticker
  List<String> emojiList;

  /// Position where the mask should be placed on faces.
  ///
  /// For “mask” stickers only.
  MaskPosition? maskPosition;

  /// List of 0-20 search keywords for the sticker with total length of up
  /// to 64 characters.
  ///
  /// For “regular” and “custom_emoji” stickers only.
  List<String>? keywords;

  /// Basic constructor
  InputSticker({
    required this.sticker,
    required this.format,
    required this.emojiList,
    this.maskPosition,
    this.keywords,
  });

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'sticker': sticker,
      'format': format,
      'emoji_list': emojiList,
      'mask_position': maskPosition,
      'keywords': keywords,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
