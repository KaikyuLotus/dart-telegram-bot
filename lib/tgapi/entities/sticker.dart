import 'thumb.dart';

class Sticker {
  String emoji;
  String fileId;
  int fileSize;
  String fileUniqueId;
  int height;
  bool isAnimated;
  String setName;
  Thumb thumb;
  int width;

  Sticker(
      {this.emoji,
      this.fileId,
      this.fileSize,
      this.fileUniqueId,
      this.height,
      this.isAnimated,
      this.setName,
      this.thumb,
      this.width});

  factory Sticker.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return Sticker(
      emoji: json['emoji'],
      fileId: json['file_id'],
      fileSize: json['file_size'],
      fileUniqueId: json['file_unique_id'],
      height: json['height'],
      isAnimated: json['is_animated'],
      setName: json['set_name'],
      thumb: json['thumb'] = Thumb.fromJson(json['thumb']),
      width: json['width'],
    );
  }
}
