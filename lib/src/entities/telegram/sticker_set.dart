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
    required this.stickers,
    this.thumbnail,
  });

  /// Creates a object from a json
  factory StickerSet.fromJson(Map<String, dynamic> json) {
    return StickerSet(
      name: json['name']!,
      title: json['title']!,
      stickerType: json['sticker_type'],
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
      'stickers': stickers,
      'photo_size': thumbnail,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
