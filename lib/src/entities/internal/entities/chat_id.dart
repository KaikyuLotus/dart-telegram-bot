class ChatID {
  int? chatId;
  String? chatUsername;

  ChatID._internal({this.chatId, this.chatUsername});

  ChatID(int chatId) {
    this.chatId = chatId;
  }

  factory ChatID.fromUsername(String username) {
    return ChatID._internal(chatUsername: username);
  }

  @override
  String toString() {
    return (chatId ?? chatUsername)!.toString();
  }
}
