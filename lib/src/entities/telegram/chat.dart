import 'dart:convert';

import 'package:dart_telegram_bot/src/entities/internal/helpers/util.dart';
import 'package:dart_telegram_bot/telegram_entities.dart';

class Chat {
  int id;
  String type;
  String? title;
  String? username;
  String? firstName;
  String? lastName;
  ChatPhoto? photo;
  String? description;
  String? inviteLink;
  Message? pinnedMessage;
  ChatPermissions? permissions;
  int? slowModeDelay;
  String? stickerSetName;
  bool? canSetStickerSet;

  Chat({
    required this.id,
    required this.type,
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
    return Chat(
      id: json['id']!,
      type: json['type']!,
      title: json['title'],
      username: json['username'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      photo: callIfNotNull(ChatPhoto.fromJson, json['photo']),
      description: json['description'],
      inviteLink: json['invite_link'],
      pinnedMessage: callIfNotNull(Message.fromJson, json['pinned_message']),
      permissions: callIfNotNull(ChatPermissions.fromJson, json['permissions']),
      slowModeDelay: json['slow_mode_delay'],
      stickerSetName: json['sticker_set_name'],
      canSetStickerSet: json['can_set_sticker_set'],
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
