import 'dart:convert';

class ChatPhoto {
  String smallFileId;
  String smallFileUniqueId;
  String bigFileId;
  String bigFileUniqueId;

  ChatPhoto({
    required this.smallFileId,
    required this.smallFileUniqueId,
    required this.bigFileId,
    required this.bigFileUniqueId,
  });

  static ChatPhoto fromJson(Map<String, dynamic> json) {
    return ChatPhoto(
      smallFileId: json['small_file_id']!,
      smallFileUniqueId: json['small_file_unique_id']!,
      bigFileId: json['big_file_id']!,
      bigFileUniqueId: json['big_file_unique_id']!,
    );
  }

  Map toJson() {
    return {
      'small_file_id': smallFileId,
      'small_file_unique_id': smallFileUniqueId,
      'big_file_id': bigFileId,
      'big_file_unique_id': bigFileUniqueId,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
