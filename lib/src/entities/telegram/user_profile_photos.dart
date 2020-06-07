part of '../../entities.dart';

class UserProfilePhotos {
  int totalCount;
  List<List<PhotoSize>> photos;

  UserProfilePhotos({this.totalCount, this.photos});

  factory UserProfilePhotos.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return UserProfilePhotos(
        totalCount: json['total_count'], photos: PhotoSize.listOfListsFromJsonArray(json['photos']));
  }
}
