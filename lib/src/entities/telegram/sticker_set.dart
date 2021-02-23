import 'package:dart_telegram_bot/telegram_entities.dart';

class StickerSet {
  String name;
  String title;
  bool isAnimated;
  bool containsMasks;
  List<Sticker> stickers;

  StickerSet({this.name, this.title, this.isAnimated, this.containsMasks, this.stickers});

  static StickerSet fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return StickerSet(
      name: json['name'],
      title: json['title'],
      isAnimated: json['is_animated'],
      containsMasks: json['contains_masks'],
      stickers: Sticker.listFromJsonArray(json['stickers']),
    );
  }
}
