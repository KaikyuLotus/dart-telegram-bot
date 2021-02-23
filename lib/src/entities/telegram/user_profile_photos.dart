import 'package:dart_telegram_bot/telegram_entities.dart';

class UserProfilePhotos {
  int totalCount;
  List<List<PhotoSize>> photos;

  UserProfilePhotos({
    this.totalCount,
    this.photos,
  });

  static UserProfilePhotos fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return UserProfilePhotos(
      totalCount: json['total_count'],
      photos: PhotoSize.listOfListsFromJsonArray(json['photos']),
    );
  }
}
