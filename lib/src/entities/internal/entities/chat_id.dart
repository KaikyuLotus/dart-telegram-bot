/// ChatID Object
class ChatID {
  /// Telegram ChatId
  int? chatId;

  /// Telegram ChatUsername
  String? chatUsername;

  ChatID._internal({this.chatUsername});

  /// ChatId constructor
  ChatID(this.chatId);

  /// Username constructor
  factory ChatID.fromUsername(String username) {
    return ChatID._internal(chatUsername: username);
  }

  @override
  String toString() {
    return (chatId ?? chatUsername)!.toString();
  }
}
