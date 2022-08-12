import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

class StickerSet {
  String name;
  String title;
  String stickerType;
  bool isAnimated;
  bool isVideo;
  List<Sticker> stickers;
  PhotoSize? thumb;

  StickerSet({
    required this.name,
    required this.title,
    required this.stickerType,
    required this.isAnimated,
    required this.isVideo,
    required this.stickers,
    this.thumb,
  });

  static StickerSet fromJson(Map<String, dynamic> json) {
    return StickerSet(
      name: json['name']!,
      title: json['title']!,
      stickerType: json['sticker_type'],
      isAnimated: json['is_animated']!,
      isVideo: json['is_video']!,
      stickers: Sticker.listFromJsonArray(json['stickers']!),
      thumb: callIfNotNull(PhotoSize.fromJson, json['thumb']),
    );
  }

  Map toJson() {
    return {
      'name': name,
      'title': title,
      'sticker_type': stickerType,
      'is_animated': isAnimated,
      'is_video': isVideo,
      'stickers': stickers,
      'photo_size': thumb,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
