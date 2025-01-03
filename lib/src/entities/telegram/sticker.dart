import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// This object represents a sticker.
class Sticker {
  /// Identifier for this file, which can be used to download or reuse the file
  String fileId;

  /// Unique identifier for this file, which is supposed to be the same over
  /// time and for different bots. Can't be used to download or reuse the file.
  String fileUniqueId;

  /// Type of the sticker, currently one of “regular”, “mask”, “custom_emoji”.
  ///
  /// The type of the sticker is independent from its format, which is
  /// determined by the fields *is_animated* and *is_video*.
  StickerType type;

  /// Sticker width
  int width;

  /// Sticker height
  int height;

  /// True, if the sticker is [animated](https://telegram.org/blog/animated-stickers)
  bool isAnimated;

  /// True, if the sticker is a [video sticker](https://telegram.org/blog/video-stickers-better-reactions)
  bool isVideo;

  /// Sticker thumbnail in the .WEBP or .JPG format
  PhotoSize? thumbnail;

  /// Emoji associated with the sticker
  String? emoji;

  /// Name of the sticker set to which the sticker belongs
  String? setName;

  /// For premium regular stickers, premium animation for the sticker
  File? premiumAnimation;

  /// For mask stickers, the position where the mask should be placed
  MaskPosition? maskPosition;

  /// For custom emoji stickers, unique identifier of the custom emoji
  String? customEmojiId;

  /// True, if the sticker must be repainted to a text color in messages,
  /// the color of the Telegram Premium badge in emoji status, white color on
  /// chat photos, or another appropriate color in other places
  bool? needsRepainting;

  /// File size in bytes
  int? fileSize;

  /// Basic constructor
  Sticker({
    required this.fileId,
    required this.fileUniqueId,
    required this.type,
    required this.width,
    required this.height,
    required this.isAnimated,
    required this.isVideo,
    this.thumbnail,
    this.emoji,
    this.setName,
    this.premiumAnimation,
    this.maskPosition,
    this.customEmojiId,
    this.needsRepainting,
    this.fileSize,
  });

  /// Creates an object from a json
  factory Sticker.fromJson(Map<String, dynamic> json) {
    return Sticker(
      fileId: json['file_id'],
      fileUniqueId: json['file_unique_id'],
      type: StickerType.forValue(json['type']),
      width: json['width'],
      height: json['height'],
      isAnimated: json['is_animated'],
      isVideo: json['is_video'],
      thumbnail: callIfNotNull(PhotoSize.fromJson, json['thumbnail']),
      emoji: json['emoji'],
      setName: json['set_name'],
      premiumAnimation: callIfNotNull(File.fromJson, json['premium_animation']),
      maskPosition: callIfNotNull(MaskPosition.fromJson, json['mask_position']),
      customEmojiId: json['custom_emoji_id'],
      needsRepainting: json['needs_repainting'],
      fileSize: json['file_size'],
    );
  }

  /// Creates a list of objects from a json array
  static List<Sticker> listFromJsonArray(List<dynamic> json) {
    return List.generate(
      json.length,
      (i) => Sticker.fromJson(json[i]),
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'file_id': fileId,
      'file_unique_id': fileUniqueId,
      'type': type,
      'width': width,
      'height': height,
      'is_animated': isAnimated,
      'is_video': isVideo,
      'thumbnail': thumbnail,
      'emoji': emoji,
      'set_name': setName,
      'premium_animation': premiumAnimation,
      'mask_position': maskPosition,
      'custom_emoji_id': customEmojiId,
      'needs_repainting': needsRepainting,
      'file_size': fileSize,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
