class ChatID {
  int? chatId;
  String? chatUsername;

  ChatID._internal({this.chatId, this.chatUsername});

  ChatID(this.chatId);

  factory ChatID.fromUsername(String username) {
    return ChatID._internal(chatUsername: username);
  }

  @override
  String toString() {
    return (chatId ?? chatUsername)!.toString();
  }
}
