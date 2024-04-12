/// ChatID Object
class ChatID {
  /// Telegram ChatId
  int? chatId;

  /// Telegram ChatUsername
  String? chatUsername;

  /// ChatId constructor
  ChatID(this.chatId);

  ChatID._internal({this.chatUsername});

  /// Username constructor
  factory ChatID.fromUsername(String username) {
    return ChatID._internal(chatUsername: username);
  }

  factory ChatID.fromJson(Map<String, dynamic> json) {
    if (int.tryParse(json['chat_id']) == null) {
      return ChatID.fromUsername(json['chat_id']);
    } else {
      return ChatID(int.parse(json['chat_id']));
    }
  }

  @override
  String toString() => (chatId ?? chatUsername)!.toString();
}
