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
}
