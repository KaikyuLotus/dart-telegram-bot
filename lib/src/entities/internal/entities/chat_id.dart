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

  @override
  String toString() => (chatId ?? chatUsername)!.toString();
}
