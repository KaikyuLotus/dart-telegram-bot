import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

class Sticker {
  String fileId;
  String fileUniqueId;
  int width;
  int height;
  bool isAnimated;
  bool isVideo;
  PhotoSize? thumb;
  String? emoji;
  String? setName;
  File? premiumAnimation;
  MaskPosition? maskPosition;
  int? fileSize;

  Sticker({
    required this.fileId,
    required this.fileUniqueId,
    required this.width,
    required this.height,
    required this.isAnimated,
    required this.isVideo,
    this.thumb,
    this.emoji,
    this.setName,
    this.premiumAnimation,
    this.maskPosition,
    this.fileSize,
  });

  static Sticker fromJson(Map<String, dynamic> json) {
    return Sticker(
      fileId: json['file_id']!,
      fileUniqueId: json['file_unique_id']!,
      width: json['width']!,
      height: json['height']!,
      isAnimated: json['is_animated']!,
      isVideo: json['is_video']!,
      thumb: callIfNotNull(PhotoSize.fromJson, json['thumb']),
      emoji: json['emoji'],
      setName: json['set_name'],
      premiumAnimation: callIfNotNull(File.fromJson, json['premium_animation']),
      maskPosition: callIfNotNull(MaskPosition.fromJson, json['mask_position']),
      fileSize: json['file_size'],
    );
  }

  static List<Sticker> listFromJsonArray(List<dynamic> json) {
    return List.generate(json.length, (i) => Sticker.fromJson(json[i]));
  }

  Map toJson() {
    return {
      'file_id': fileId,
      'file_unique_id': fileUniqueId,
      'width': width,
      'height': height,
      'is_animated': isAnimated,
      'is_video': isVideo,
      'thumb': thumb,
      'emoji': emoji,
      'set_name': setName,
      'premium_animation': premiumAnimation,
      'mask_position': maskPosition,
      'file_size': fileSize,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
