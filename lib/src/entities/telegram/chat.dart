import 'package:dart_telegram_bot/telegram_entities.dart';

class Chat {
  int id;
  String type;
  String title;
  String username;
  String firstName;
  String lastName;
  ChatPhoto photo;
  String description;
  String inviteLink;
  Message pinnedMessage;
  ChatPermissions permissions;
  int slowModeDelay;
  String stickerSetName;
  bool canSetStickerSet;

  Chat({
    this.id,
    this.type,
    this.title,
    this.username,
    this.firstName,
    this.lastName,
    this.photo,
    this.description,
    this.inviteLink,
    this.pinnedMessage,
    this.permissions,
    this.slowModeDelay,
    this.stickerSetName,
    this.canSetStickerSet,
  });

  static Chat fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return Chat(
      id: json['id'],
      type: json['type'],
      title: json['title'],
      username: json['username'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      photo: ChatPhoto.fromJson(json['photo']),
      description: json['description'],
      inviteLink: json['invite_link'],
      pinnedMessage: Message.fromJson(json['pinned_message']),
      permissions: ChatPermissions.fromJson(json['permissions']),
      slowModeDelay: json['slow_mode_delay'],
      stickerSetName: json['sticker_set_name'],
      canSetStickerSet: json['can_set_sticker_set'],
    );
  }
}
