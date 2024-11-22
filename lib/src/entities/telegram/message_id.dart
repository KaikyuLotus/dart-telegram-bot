import 'dart:convert';

/// This object represents a unique message identifier.
class MessageId {
  /// Unique message identifier
  int messageId;

  /// Basic constructor
  MessageId({required this.messageId});

  /// Creates a object from a json
  factory MessageId.fromJson(Map<String, dynamic> json) {
    return MessageId(messageId: json['message_id']);
  }

  /// Creates a list of object from a json array
  static List<MessageId> listFromJsonArray(List<dynamic> array) {
    return List.generate(
      array.length,
      (i) => MessageId.fromJson(array[i]),
    );
  }

  /// Creates a json from the object
  Map toJson() => {'message_id': messageId};

  @override
  String toString() => json.encode(this);
}
