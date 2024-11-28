import 'dart:convert';

import '../../../telegram_entities.dart';

/// The paid media is a photo.
class PaidMediaPhoto extends PaidMedia {
  /// Type of the paid media, always “photo”
  @override
  String type = 'photo';

  /// The photo
  List<PhotoSize> photo;

  /// Basic constructor
  PaidMediaPhoto({
    required this.photo,
  });

  /// Creates an object from a json
  factory PaidMediaPhoto.fromJson(Map<String, dynamic> json) {
    return PaidMediaPhoto(
      photo: PhotoSize.listFromJsonArray(json['photo']),
    );
  }

  /// Creates a json from the object
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'photo': photo,
    };
  }

  @override
  String toString() => json.encode(this);
}
