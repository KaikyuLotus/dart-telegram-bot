import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

class StickerSet {
  String name;
  String title;
  bool isAnimated;
  bool isVideo;
  bool containsMasks;
  List<Sticker> stickers;
  PhotoSize? thumb;

  StickerSet({
    required this.name,
    required this.title,
    required this.isAnimated,
    required this.isVideo,
    required this.containsMasks,
    required this.stickers,
    this.thumb,
  });

  static StickerSet fromJson(Map<String, dynamic> json) {
    return StickerSet(
      name: json['name']!,
      title: json['title']!,
      isAnimated: json['is_animated']!,
      isVideo: json['is_video']!,
      containsMasks: json['contains_masks']!,
      stickers: Sticker.listFromJsonArray(json['stickers']!),
      thumb: callIfNotNull(PhotoSize.fromJson, json['thumb']),
    );
  }

  Map toJson() {
    return {
      'name': name,
      'title': title,
      'is_animated': isAnimated,
      'is_video': isVideo,
      'contains_masks': containsMasks,
      'stickers': stickers,
      'photo_size': thumb,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
