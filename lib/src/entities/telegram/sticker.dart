import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

/// This object represents a sticker.
class Sticker {
  /// Identifier for this file, which can be used to download or reuse the file
  String fileId;

  /// Unique identifier for this file, which is supposed to be the same over
  /// time and for different bots.
  /// Can't be used to download or reuse the file.
  String fileUniqueId;

  /// Type of the sticker, currently one of “regular”, “mask”, “custom_emoji”.
  /// The type of the sticker is independent from its format, which is
  /// determined by the fields is_animated and is_video.
  String type;

  /// Sticker width
  int width;

  /// Sticker height
  int height;

  /// True, if the sticker is animated
  bool isAnimated;

  /// True, if the sticker is a video sticker
  bool isVideo;

  /// Optional.
  /// Sticker thumbnail in the .WEBP or .JPG format
  PhotoSize? thumbnail;

  /// Optional.
  /// Emoji associated with the sticker
  String? emoji;

  /// Optional.
  /// Name of the sticker set to which the sticker belongs
  String? setName;

  /// Optional.
  /// For premium regular stickers, premium animation for the sticker
  File? premiumAnimation;

  /// Optional.
  /// For mask stickers, the position where the mask should be placed
  MaskPosition? maskPosition;

  /// Optional.
  /// For custom emoji stickers, unique identifier of the custom emoji
  String? customEmojiId;

  /// Optional.
  /// True, if the sticker must be repainted to a text color in messages,
  /// the color of the Telegram Premium badge in emoji status, white color on
  /// chat photos, or another appropriate color in other places
  bool? needRepainting;

  /// Optional.
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
    this.needRepainting,
    this.fileSize,
  });

  /// Creates a object from a json
  static Sticker fromJson(Map<String, dynamic> json) {
    return Sticker(
      fileId: json['file_id']!,
      fileUniqueId: json['file_unique_id']!,
      type: json['type'],
      width: json['width']!,
      height: json['height']!,
      isAnimated: json['is_animated']!,
      isVideo: json['is_video']!,
      thumbnail: callIfNotNull(PhotoSize.fromJson, json['thumbnail']),
      emoji: json['emoji'],
      setName: json['set_name'],
      premiumAnimation: callIfNotNull(File.fromJson, json['premium_animation']),
      maskPosition: callIfNotNull(MaskPosition.fromJson, json['mask_position']),
      customEmojiId: json['custom_emoji_id'],
      needRepainting: json['need_repainting'],
      fileSize: json['file_size'],
    );
  }

  /// Creates a list of object from a json array
  static List<Sticker> listFromJsonArray(List<dynamic> json) {
    return List.generate(json.length, (i) => Sticker.fromJson(json[i]));
  }

  /// Creates a json from the object
  Map toJson() {
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
      'need_repainting': needRepainting,
      'file_size': fileSize,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
