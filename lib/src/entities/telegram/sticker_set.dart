import 'dart:convert';

import 'package:dart_telegram_bot/src/entities/internal/helpers/util.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';

class StickerSet {
  String name;
  String title;
  bool isAnimated;
  bool containsMasks;
  List<Sticker> stickers;
  PhotoSize? thumb;

  StickerSet({
    required this.name,
    required this.title,
    required this.isAnimated,
    required this.containsMasks,
    required this.stickers,
    this.thumb,
  });

  static StickerSet fromJson(Map<String, dynamic> json) {
    return StickerSet(
      name: json['name']!,
      title: json['title']!,
      isAnimated: json['is_animated']!,
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
      'contains_masks': containsMasks,
      'stickers': stickers,
      'photo_size': thumb,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
