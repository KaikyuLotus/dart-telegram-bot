import '../../../telegram_entities.dart';

/// This object contains information about one member of a chat.
///
/// Currently, the following 6 types of chat members are supported:
/// [ChatMemberOwner],
/// [ChatMemberAdministrator],
/// [ChatMemberMember],
/// [ChatMemberRestricted],
/// [ChatMemberLeft],
/// [ChatMemberBanned]
abstract class ChatMember {
  abstract final String status;

  abstract final User user;

  /// Creates an object from a json
  static ChatMember fromJson(Map<String, dynamic> json) {
    switch (json['status']) {
      case 'creator':
        return ChatMemberOwner.fromJson(json);
      case 'administrator':
        return ChatMemberAdministrator.fromJson(json);
      case 'member':
        return ChatMemberMember.fromJson(json);
      case 'restricted':
        return ChatMemberRestricted.fromJson(json);
      case 'left':
        return ChatMemberLeft.fromJson(json);
      case 'kicked':
        return ChatMemberBanned.fromJson(json);
      default:
        throw Exception('ChatMember type not recognized');
    }
  }

  /// Creates a list of objects from a json array
  static List<ChatMember> listFromJsonArray(List<dynamic> array) {
    return List.generate(
      array.length,
      (i) => ChatMember.fromJson(array[i]),
    );
  }
}
