import 'dart:convert';

import 'package:dart_telegram_bot/telegram_entities.dart';

class UserProfilePhotos {
  int totalCount;
  List<List<PhotoSize>> photos;

  UserProfilePhotos({
    required this.totalCount,
    required this.photos,
  });

  static UserProfilePhotos fromJson(Map<String, dynamic> json) {
    return UserProfilePhotos(
      totalCount: json['total_count']!,
      photos: PhotoSize.listOfListsFromJsonArray(json['photos']!),
    );
  }

  Map toJson() {
    return {
      'total_count': totalCount,
      'photos': photos,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
