import 'dart:convert';

import '../../../telegram_entities.dart';
import '../internal/helpers/util.dart';

class Chat {
  int id;
  String type;
  String? title;
  String? username;
  String? firstName;
  String? lastName;
  ChatPhoto? photo;
  String? bio;
  String? description;
  String? inviteLink;
  Message? pinnedMessage;
  ChatPermissions? permissions;
  int? slowModeDelay;
  String? stickerSetName;
  bool? canSetStickerSet;
  int? messageAutoDeleteTime;
  int? linkedChatId;
  ChatLocation? location;

  Chat({
    required this.id,
    required this.type,
    this.title,
    this.username,
    this.firstName,
    this.lastName,
    this.photo,
    this.bio,
    this.description,
    this.inviteLink,
    this.pinnedMessage,
    this.permissions,
    this.slowModeDelay,
    this.stickerSetName,
    this.canSetStickerSet,
    this.linkedChatId,
    this.messageAutoDeleteTime,
    this.location,
  });

  static Chat fromJson(Map<String, dynamic> json) {
    return Chat(
      id: json['id']!,
      type: json['type']!,
      title: json['title'],
      username: json['username'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      photo: callIfNotNull(ChatPhoto.fromJson, json['photo']),
      bio: json['bio'],
      description: json['description'],
      inviteLink: json['invite_link'],
      pinnedMessage: callIfNotNull(Message.fromJson, json['pinned_message']),
      permissions: callIfNotNull(ChatPermissions.fromJson, json['permissions']),
      slowModeDelay: json['slow_mode_delay'],
      stickerSetName: json['sticker_set_name'],
      canSetStickerSet: json['can_set_sticker_set'],
      linkedChatId: json['linked_chat_id'],
      messageAutoDeleteTime: json['message_auto_delete_time'],
      location: callIfNotNull(
        ChatLocation.fromJson,
        json['location'],
      ),
    );
  }

  Map toJson() {
    return {
      'id': id,
      'type': type,
      'title': title,
      'username': username,
      'first_name': firstName,
      'last_name': lastName,
      'photo': photo,
      'description': description,
      'invite_link': inviteLink,
      'pinned_message': pinnedMessage,
      'permissions': permissions,
      'slow_mode_delay': slowModeDelay,
      'sticker_set_name': stickerSetName,
      'can_set_sticker_set': canSetStickerSet,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
