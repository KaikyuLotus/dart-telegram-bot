import 'dart:convert';

import '../../../telegram_entities.dart';

/// This object represent a user's profile pictures.
class UserProfilePhotos {
  /// Total number of profile pictures the target user has
  int totalCount;

  /// Requested profile pictures (in up to 4 sizes each)
  List<List<PhotoSize>> photos;

  /// Basic constructor
  UserProfilePhotos({
    required this.totalCount,
    required this.photos,
  });

  /// Creates a object from a json
  static UserProfilePhotos fromJson(Map<String, dynamic> json) {
    return UserProfilePhotos(
      totalCount: json['total_count']!,
      photos: PhotoSize.listOfListsFromJsonArray(json['photos']!),
    );
  }

  /// Creates a json from the object
  Map toJson() {
    return {
      'total_count': totalCount,
      'photos': photos,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
