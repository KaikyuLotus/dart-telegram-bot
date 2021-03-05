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
      thumb: callIfNotNull(PhotoSize.fromJson, json['photo_size']),
    );
  }
}
