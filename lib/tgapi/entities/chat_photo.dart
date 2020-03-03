class ChatPhoto {
  String smallFileId;
  String smallFileUniqueId;
  String bigFileId;
  String bigFileUniqueId;

  ChatPhoto({this.smallFileId, this.smallFileUniqueId, this.bigFileId, this.bigFileUniqueId});

  factory ChatPhoto.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return ChatPhoto(
        smallFileId: json['small_file_id'],
        smallFileUniqueId: json['small_file_unique_id'],
        bigFileId: json['big_file_id'],
        bigFileUniqueId: json['big_file_unique_id']);
  }
}
