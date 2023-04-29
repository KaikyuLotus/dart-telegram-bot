import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// This object represents a sticker set.
class StickerSet {
  /// Sticker set name
  String name;

  /// Sticker set title
  String title;

  /// Type of stickers in the set, currently one of “regular”, “mask”,
  /// “custom_emoji”
  String stickerType;

  /// True, if the sticker set contains animated stickers
  bool isAnimated;

  /// True, if the sticker set contains video stickers
  bool isVideo;

  /// List of all set stickers
  List<Sticker> stickers;

  /// Optional.
  /// Sticker set thumbnail in the .WEBP, .TGS, or .WEBM format
  PhotoSize? thumbnail;

  /// Basic constructor
  StickerSet({
    required this.name,
    required this.title,
    required this.stickerType,
    required this.isAnimated,
    required this.isVideo,
    required this.stickers,
    this.thumbnail,
  });

  /// Creates a object from a json
  static StickerSet fromJson(Map<String, dynamic> json) {
    return StickerSet(
      name: json['name']!,
      title: json['title']!,
      stickerType: json['sticker_type'],
      isAnimated: json['is_animated']!,
      isVideo: json['is_video']!,
      stickers: Sticker.listFromJsonArray(json['stickers']!),
      thumbnail: callIfNotNull(PhotoSize.fromJson, json['thumbnail']),
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'name': name,
      'title': title,
      'sticker_type': stickerType,
      'is_animated': isAnimated,
      'is_video': isVideo,
      'stickers': stickers,
      'photo_size': thumbnail,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
