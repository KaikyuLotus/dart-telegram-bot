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
  bool? hasPrivateForwards;
  String? description;
  String? inviteLink;
  Message? pinnedMessage;
  ChatPermissions? permissions;
  int? slowModeDelay;
  int? messageAutoDeleteTime;
  bool? hasProtectedContent;
  String? stickerSetName;
  bool? canSetStickerSet;
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
    this.hasPrivateForwards,
    this.description,
    this.inviteLink,
    this.pinnedMessage,
    this.permissions,
    this.slowModeDelay,
    this.messageAutoDeleteTime,
    this.hasProtectedContent,
    this.stickerSetName,
    this.canSetStickerSet,
    this.linkedChatId,
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
      hasPrivateForwards: json['has_private_forwards'],
      description: json['description'],
      inviteLink: json['invite_link'],
      pinnedMessage: callIfNotNull(Message.fromJson, json['pinned_message']),
      permissions: callIfNotNull(ChatPermissions.fromJson, json['permissions']),
      slowModeDelay: json['slow_mode_delay'],
      messageAutoDeleteTime: json['message_auto_delete_time'],
      hasProtectedContent: json['has_protected_content'],
      stickerSetName: json['sticker_set_name'],
      canSetStickerSet: json['can_set_sticker_set'],
      linkedChatId: json['linked_chat_id'],
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
      'bio': bio,
      'has_private_forwards': hasPrivateForwards,
      'description': description,
      'invite_link': inviteLink,
      'pinned_message': pinnedMessage,
      'permissions': permissions,
      'slow_mode_delay': slowModeDelay,
      'message_auto_delete_time': messageAutoDeleteTime,
      'has_protected_content': hasProtectedContent,
      'sticker_set_name': stickerSetName,
      'can_set_sticker_set': canSetStickerSet,
      'linked_chat_id': linkedChatId,
      'location': location,
    }..removeWhere((_, v) => v == null);
  }

  @override
  String toString() => json.encode(this);
}
